% Indirect multiple shooting — two-state example
clear; close all; clc
import casadi.*
N = 10; T = 1; dt = T/N;
x = SX.sym('x',2); lam = SX.sym('lam',2); u = SX.sym('u');
xdot = [x(2); u];
H = 0.5*(x'*x + u^2) + lam'*xdot;
u_opt = fmin(fmax(-lam(2), -1), 1);
f = Function('f',{[x;lam]},{substitute([xdot; -gradient(H,x)], u, u_opt)});
Z = SX.sym('Z',4,N+1);
g = [];
for k=1:N
    g = [g; Z(:,k+1) - (Z(:,k) + dt*f(Z(:,k)))];
end
g = [g; Z(1:2,1); Z(3:4,N+1)];
solver = nlpsol('solver','ipopt',struct('f',0,'x',reshape(Z,4*(N+1),1),'g',g),struct('ipopt',struct('print_level',0),'print_time',0));
sol = solver('x0',zeros(4*(N+1),1),'lbg',zeros(size(g)),'ubg',zeros(size(g)));
disp(full(sol.x(1:8))')
