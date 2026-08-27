%Written By Hamzeh Kashi Yarandi
clc
clear 
close all
import casadi.*

A_wall = 100; A_flr = 10; alpha = 0.5; beta = 2; gamma = 0.5; delta = 2;
h = SX.sym('h'); w = SX.sym('w'); d = SX.sym('d');
obj = -h*d*w;
g = [2*(h*w+h*d); w*d; h/w; d/w];
P = [];
OPT_variables = [h;w;d];
nlp_prob = struct('f', obj, 'x', OPT_variables, 'g', g, 'p', P);

opts = struct;
opts.ipopt.max_iter = 1000;
opts.ipopt.print_level = 0;
opts.print_time = 0;
solver = nlpsol('solver', 'ipopt', nlp_prob,opts);

args = struct;
args.lbx = 0; args.ubx = +inf;
args.lbg = [-inf;-inf;alpha;gamma];
args.ubg = [A_wall;A_flr;beta;delta];
args.p = []; args.x0 = [3;4;5];
sol = solver('x0', args.x0, 'lbx', args.lbx, 'ubx', args.ubx, 'lbg', args.lbg, 'ubg', args.ubg, 'p', args.p);
x_optimal = full(sol.x)
f_optimal = -full(sol.f)
