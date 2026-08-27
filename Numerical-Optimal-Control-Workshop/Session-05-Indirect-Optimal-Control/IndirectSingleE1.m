% Indirect single shooting — scalar example
clear; close all; clc
import casadi.*
x = SX.sym('x'); lam = SX.sym('lam'); u = SX.sym('u');
H = 0.25*u^2 + lam*(x+u);
u_opt = fmin(fmax((-gradient(H,u))/0.5, -5), 5);
f = substitute([x+u; -gradient(H,x)], u, u_opt);
ode = struct('x',[x;lam],'ode',f);
I = integrator('I','cvodes',ode,struct('t0',0,'tf',7));
l0 = MX.sym('l0');
Xf = I('x0',[1;l0]);
g = Xf.xf(2) - 0.5*Xf.xf(1);
solver = rootfinder('solver','newton',Function('rfp',{l0},{g}));
l_opt = full(solver(1));
disp(l_opt)
