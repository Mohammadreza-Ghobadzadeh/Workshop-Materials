%Written By Hamzeh Kashi Yarandi
clc
clear
close all
import casadi.*
x = SX.sym('x');
obj = x^2-6*x+13;
nlp_prob = struct('f', obj, 'x', x, 'g', [], 'p', []);
solver = nlpsol('solver', 'ipopt', nlp_prob);
sol = solver('x0', -0.5, 'lbx', -inf, 'ubx', +inf, 'lbg', -inf, 'ubg', +inf, 'p', []);
x_optimal = full(sol.x)
f_optimal = full(sol.f)
