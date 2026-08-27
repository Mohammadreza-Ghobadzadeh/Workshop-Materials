% Indirect single shooting — two-state example with bounded control
clear; close all; clc
import casadi.*
x = SX.sym('x',2); lam = SX.sym('lam',2); u = SX.sym('u');
xdot = [x(2); u];
H = 0.5*(x'*x + u^2) + lam'*xdot;
u_opt = fmin(fmax(-lam(2), -1), 1);
f = substitute([xdot; -gradient(H,x)], u, u_opt);
I = integrator('I','cvodes',struct('x',[x;lam],'ode',f),struct('t0',0,'tf',1));
l0 = MX.sym('l0',2);
Xf = I('x0',[0;0;l0]);
g = Xf.xf(3:4);
solver = rootfinder('solver','newton',Function('rfp',{l0},{g}));
disp(full(solver([0;0])))
