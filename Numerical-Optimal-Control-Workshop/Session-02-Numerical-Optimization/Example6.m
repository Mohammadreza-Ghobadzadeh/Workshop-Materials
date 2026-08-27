%Written By Hamzeh Kashi Yarandi
clc
clear 
close all
import casadi.*

x1 = SX.sym('x1');
x2 = SX.sym('x2');
discrete = [false; true];
obj = 8 * x1 + x2;
g = [4*x1 + x2; 2*x1 + x2];
P = [];
OPT_variables = [x1;x2];
nlp_prob = struct('f', obj, 'x', OPT_variables, 'g', g, 'p', P);

opts = struct;
opts.discrete = discrete;
opts.bonmin.bb_log_level = 0;
opts.print_time = false;
solver = nlpsol('solver', 'bonmin', nlp_prob,opts);

args = struct;
args.lbx = 0; args.ubx = +inf;
args.lbg = [33;-inf]; args.ubg = [+inf;20];
args.p = []; args.x0 = [0;0];
sol = solver('x0', args.x0, 'lbx', args.lbx, 'ubx', args.ubx, 'lbg', args.lbg, 'ubg', args.ubg, 'p', args.p);
x_optimal = full(sol.x)
f_optimal = full(sol.f)
