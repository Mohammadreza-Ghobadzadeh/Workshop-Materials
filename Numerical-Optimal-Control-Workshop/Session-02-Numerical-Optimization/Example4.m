%Written By Hamzeh Kashi Yarandi
clc
clear 
close all
import casadi.*

x = SX.sym('x',2);
obj = 0.5 * (x(1)^2 + 2 * x(2)^2 - 2 * x(1) * x(2)) - 2 * x(1) - 6 * x(2);
g = [x(1) + x(2); -x(1) + 2 * x(2); 2 * x(1) + x(2)];
P = [];
OPT_variables = x;
nlp_prob = struct('f', obj, 'x', OPT_variables, 'g', g, 'p', P);

opts = struct;
opts.ipopt.max_iter = 1000;
opts.ipopt.print_level = 0;
opts.print_time = 0;
opts.ipopt.acceptable_tol =1e-8;
opts.ipopt.acceptable_obj_change_tol = 1e-6;
solver = nlpsol('solver', 'ipopt', nlp_prob,opts);

args = struct;
args.lbx = 0;
args.ubx = +inf;
args.lbg = -inf;
args.ubg = [2;2;3];
args.p = [];
args.x0 = [1;1];
sol = solver('x0', args.x0, 'lbx', args.lbx, 'ubx', args.ubx, 'lbg', args.lbg, 'ubg', args.ubg, 'p', args.p);
x_optimal = full(sol.x)
f_optimal = full(sol.f)
