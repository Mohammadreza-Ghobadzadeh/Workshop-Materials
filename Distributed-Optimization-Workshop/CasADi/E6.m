%Written By Hamzeh Kashi Yarandi
clc
clear 
close all
%% Plot Setting
set(0,'DefaultAxesFontName', 'Times New Roman')
set(0,'DefaultAxesFontSize', 12)
line_width = 1.5;
fontsize_labels = 14;

%% compose the optimization problem
import casadi.*
T = 0.2; % sampling time [s]
N = 30;  % prediction horizon

v_max = 0.6; v_min = -v_max;
omega_max = pi/4; omega_min = -omega_max;
x_max = 2; x_min = -x_max;

x = SX.sym('x');
y = SX.sym('y');
theta = SX.sym('theta');
states = [x;y;theta];
n_states = length(states);

v = SX.sym('v');
omega = SX.sym('omega');
controls = [v;omega];
n_controls = length(controls);

rhs = [v*cos(theta);
       v*sin(theta);
       omega];

f = Function('f',{states,controls},{rhs});
U = SX.sym('U',n_controls,N);
X = SX.sym('X',n_states,(N+1));
P = SX.sym('P',n_states + n_states);

X(:,1) = P(1:n_states);
for k = 1:N
    st = X(:,k);
    con = U(:,k);
    f_value  = f(st,con);
    st_next  = st+ (T*f_value);
    X(:,k+1) = st_next;
end
ff=Function('ff',{U,P},{X});

obj = 0;
Q = zeros(n_states,n_states);
Q(1,1) = 1; Q(2,2) = 5; Q(3,3) = 0.1;
R = zeros(n_controls,n_controls);
R(1,1) = 0.5; R(2,2) = 0.05;
for k=1:N
    st = X(:,k);  con = U(:,k);
    obj = obj+(st-P(n_states+1:n_states*2))'*Q*(st-P(n_states+1:n_states*2)) ...
        + con'*R*con;
end

g = [];
for k = 1:N+1
    g = [g ; X(1,k)];
    g = [g ; X(2,k)];
end

OPT_variables = reshape(U,n_controls*N,1);
nlp_prob = struct('f', obj, 'x', OPT_variables, 'g', g, 'p', P);

opts = struct;
opts.ipopt.max_iter = 100;
opts.ipopt.print_level =0;
opts.print_time = 0;
opts.ipopt.acceptable_tol =1e-8;
opts.ipopt.acceptable_obj_change_tol = 1e-6;
solver = nlpsol('solver', 'ipopt', nlp_prob,opts);

args = struct;
args.lbx(1:n_controls:n_controls*N-1,1) = v_min;
args.lbx(2:n_controls:n_controls*N,1)   = omega_min;
args.ubx(1:n_controls:n_controls*N-1,1) = v_max;
args.ubx(2:n_controls:n_controls*N,1)   = omega_max;
args.lbg = x_min;
args.ubg = x_max;

x0 = [0 ; 0 ; 0];
xs = [1.5 ; 1.5 ; 0];
u0 = zeros(N,n_controls);
args.p   = [x0;xs];
args.x0 = reshape(u0',n_controls*N,1);

tic
sol = solver('x0', args.x0, 'lbx', args.lbx, 'ubx', args.ubx,...
        'lbg', args.lbg, 'ubg', args.ubg,'p',args.p);
toc

u = reshape(full(sol.x)',n_controls,N);
xx = full(ff(u,args.p));
