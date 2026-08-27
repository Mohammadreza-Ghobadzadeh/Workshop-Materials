clc; clear; close all;
Ts = 0.1;
nSteps = 1;
Q = diag([100,0.01]);
R = 0.001;
x1_max = 2*pi; x1_min = -pi/2; x2_max = 10; u_max = 10;
LQR_design(Q, R);
N = 20;
input.Ts = Ts; input.nSteps = nSteps;
N_x1 = 200; N_x2 = 40; N_u = 20;
x1_values = linspace(x1_min, x1_max, N_x1);
x2_values = linspace(-x2_max, x2_max, N_x2);
u_values = linspace(-u_max, u_max, N_u);
[X1, X2] = meshgrid(x1_values, x2_values);
load lqr.mat A B Q R K P
LQR_cost = zeros(N_x1, N_x2);
LQR_u = zeros(N_x1, N_x2);
for i = 1:N_x1
    for j = 1:N_x2
        x = [x1_values(i); x2_values(j)];
        LQR_cost(i,j) = x' * P * x;
        LQR_u(i,j) = -K*x;
    end
end
J_cost = LQR_cost;
for k = N-1:-1:1
    u_map = NaN * ones(N_x1, N_x2);
    J_new = inf + J_cost;
    for i1 = 1:N_x1
        for i2 = 1:N_x2
            x_k = [x1_values(i1); x2_values(i2)];
            input.x = x_k;
            for j = 1:N_u
                u_k = u_values(j);
                input.u = u_k;
                output = RK4_integrator(@ode, input);
                i1_next = projection(output.value(1), x1_values);
                i2_next = projection(output.value(2), x2_values);
                if i1_next <= 0 || i1_next > N_x1 || i2_next <= 0 || i2_next > N_x2
                    cost = Inf;
                else
                    cost = x_k' * Q * x_k + u_k' * R * u_k + J_cost(i1_next, i2_next);
                end
                if cost < J_new(i1,i2)
                    J_new(i1,i2) = cost;
                    u_map(i1,i2) = u_k;
                end
            end
        end
    end
    J_cost = J_new;
end
save DP.mat x1_values x2_values u_values J_cost u_map Ts nSteps u_max
