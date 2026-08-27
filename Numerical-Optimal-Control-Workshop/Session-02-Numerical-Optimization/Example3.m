%Written By Hamzeh Kashi Yarandi
clc
clear
close all
import casadi.*
x = [0,45,90,135,180];
y = [95,89,183,297,636];
m = SX.sym('m'); c = SX.sym('c');
obj = 0;
for i = 1:length(x)
    obj = obj + (y(i) - (m*x(i)+c))^2;
end
nlp_prob = struct('f', obj, 'x', [m;c], 'g', [], 'p', []);
solver = nlpsol('solver', 'ipopt', nlp_prob);
sol = solver('x0', [2;1], 'lbx', -inf, 'ubx', +inf, 'lbg', -inf, 'ubg', +inf, 'p', []);
x_optimal = full(sol.x)
f_optimal = full(sol.f)
