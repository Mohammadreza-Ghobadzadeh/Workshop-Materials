%Written By Hamzeh Kashi Yarandi
clc
clear
close all
import casadi.*
x = SX.sym('x');
obj = sin(x);
nlp_prob = struct('f', obj, 'x', x, 'g', [], 'p', []);
opts = struct; opts.ipopt.print_level = 0; opts.print_time = 0;
solver = nlpsol('solver', 'ipopt', nlp_prob, opts);
sol = solver('x0', 2.6*pi, 'lbx', 0, 'ubx', 4*pi, 'lbg', -inf, 'ubg', +inf, 'p', []);
x_optimal = full(sol.x)
f_optimal = full(sol.f)
