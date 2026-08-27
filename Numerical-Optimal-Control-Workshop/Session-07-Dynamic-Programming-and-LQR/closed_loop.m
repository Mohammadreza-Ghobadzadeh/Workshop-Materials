% Written by Mohammadreza Ghobadzadeh
clc; clear all; close all;
x0 = [pi; 0];
load lqr.mat A B Q R K P
load DP.mat x1_values x2_values u_values J_cost u_map Ts nSteps u_max
input.Ts = Ts;
input.nSteps = nSteps * 2;
time = 0; Tf = 5;
state_LQR = x0; state_DP = x0;
us_DP = []; us_LQR = [];
cost_DP = 0; cost_LQR = 0; iter = 0;
while time(end) < Tf
    u_LQR = min(max(-K*state_LQR(:,end), -u_max), u_max);
    us_LQR = [us_LQR u_LQR];
    cost_LQR = [cost_LQR cost_LQR(end)+u_LQR.'*R*u_LQR+state_LQR(:,end).'*Q*state_LQR(:,end)];
    input.x = state_LQR(:,end); input.u = u_LQR;
    output = RK4_integrator(@ode, input);
    state_LQR(:,end+1) = output.value;
    i1 = projection(state_DP(1,end), x1_values);
    i2 = projection(state_DP(2,end), x2_values);
    u_DP = u_map(i1, i2);
    us_DP = [us_DP u_DP];
    cost_DP = [cost_DP cost_DP(end)+u_DP.'*R*u_DP+state_DP(:,end).'*Q*state_DP(:,end)];
    input.x = state_DP(:,end); input.u = u_DP;
    output = RK4_integrator(@ode, input);
    state_DP(:,end+1) = output.value;
    iter = iter+1;
    time(end+1) = iter*Ts;
end
animatePendulum(state_LQR(1,:), 0.1, 'pendu_LQR.gif')
animatePendulum(state_DP(1,:), 0.1, 'pendu_DP.gif')
