% point stabilization + Single shooting
clear
close all
clc
% CasADi must already be installed and available on the MATLAB path.
import casadi.*

T = 0.2; % sampling time [s]
N = 20; % prediction horizon
rob_diam = 0.3;

v_max = 0.6; v_min = -v_max;
omega_max = pi/4; omega_min = -omega_max;

x = SX.sym('x'); y = SX.sym('y'); theta = SX.sym('theta');
states = [x;y;theta]; n_states = length(states);

v = SX.sym('v'); omega = SX.sym('omega');
controls = [v;omega]; n_controls = length(controls);
rhs = [v*cos(theta);v*sin(theta);omega]; % system r.h.s

f = Function('f',{states,controls},{rhs}); % nonlinear mapping function f(x,u)
U = SX.sym('U',n_controls,N); % Decision variables (controls)
P = SX.sym('P',n_states + n_states);

X = SX.sym('X',n_states,(N+1));

% compute solution symbolically
X(:,1) = P(1:3); % initial state
for k = 1:N
    st = X(:,k);  con = U(:,k);
    f_value  = f(st,con);
    st_next  = st+ (T*f_value);
    X(:,k+1) = st_next;
end
ff=Function('ff',{U,P},{X});

obj = 0; % Objective function
g = [];  % constraints vector

Q = zeros(3,3); Q(1,1) = 1;Q(2,2) = 5;Q(3,3) = 0.1; % weighing matrices (states)
R = zeros(2,2); R(1,1) = 0.5; R(2,2) = 0.05; % weighing matrices (controls)
for k=1:N
    st = X(:,k);  con = U(:,k);
    obj = obj+(st-P(4:6))'*Q*(st-P(4:6)) + con'*R*con; % calculate obj
end

for k = 1:N+1   % box constraints due to the map margins
    g = [g ; X(1,k)];   %state x
    g = [g ; X(2,k)];   %state y
end

OPT_variables = reshape(U,2*N,1);
nlp_prob = struct('f', obj, 'x', OPT_variables, 'g', g, 'p', P);

opts = struct;
opts.ipopt.max_iter = 100;
opts.ipopt.print_level =0;%0,3
opts.print_time = 0;
opts.ipopt.acceptable_tol =1e-8;
opts.ipopt.acceptable_obj_change_tol = 1e-6;

solver = nlpsol('solver', 'ipopt', nlp_prob,opts);

args = struct;
args.lbg = -2;  % lower bound of the states x and y
args.ubg = 2;   % upper bound of the states x and y

args.lbx(1:2:2*N-1,1) = v_min; args.lbx(2:2:2*N,1)   = omega_min;
args.ubx(1:2:2*N-1,1) = v_max; args.ubx(2:2:2*N,1)   = omega_max;

t0 = 0;
x0 = [0 ; 0 ; 0.0];    % initial condition.
xs = [1.5 ; 1.5 ; 0]; % Reference posture.

xx(:,1) = x0;
t(1) = t0;

u0 = zeros(N,2);
sim_tim = 20;

mpciter = 0;
xx1 = [];
u_cl=[];

main_loop = tic;
while(norm((x0-xs),2) > 1e-2 && mpciter < sim_tim / T)
    args.p   = [x0;xs];
    args.x0 = reshape(u0',2*N,1);
    sol = solver('x0', args.x0, 'lbx', args.lbx, 'ubx', args.ubx,...
            'lbg', args.lbg, 'ubg', args.ubg,'p',args.p);
    u = reshape(full(sol.x)',2,N)';
    ff_value = ff(u',args.p);
    xx1(:,1:3,mpciter+1)= full(ff_value)';

    u_cl= [u_cl ; u(1,:)];
    t(mpciter+1) = t0;
    [t0, x0, u0] = shift(T, t0, x0, u,f);

    xx(:,mpciter+2) = x0;
    disp(mpciter);
    mpciter = mpciter + 1;
end
disp('==========================================================')
main_loop_time = toc(main_loop);
disp(main_loop_time/mpciter)
disp('==========================================================')
ss_error = norm((x0-xs),2);
disp(ss_error);
Draw_MPC_point_stabilization_v1 (t,xx,xx1,u_cl,xs,N,rob_diam)
