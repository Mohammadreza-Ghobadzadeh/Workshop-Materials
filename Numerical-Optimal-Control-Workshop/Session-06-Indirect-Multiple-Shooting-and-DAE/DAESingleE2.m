% DAE-constrained single shooting using IDAS + IPOPT
clear; close all; clc
import casadi.*
x = SX.sym('x'); z = SX.sym('z'); u = SX.sym('u');
dae = struct('x',x,'z',z,'p',u,'ode',z,'alg',z-u);
I = integrator('I','idas',dae,struct('t0',0,'tf',0.2));
N = 10; U = SX.sym('U',N);
Xk = 0; obj = 0; g = [];
for k=1:N
    sk = I('x0',Xk,'z0',0,'p',U(k));
    Xk = sk.xf;
    obj = obj + U(k)^2 + Xk^2;
end
g = Xk;
solver = nlpsol('solver','ipopt',struct('f',obj,'x',U,'g',g),struct('ipopt',struct('print_level',0),'print_time',0));
sol = solver('x0',zeros(N,1),'lbx',-1*ones(N,1),'ubx',ones(N,1),'lbg',0,'ubg',0);
disp(full(sol.x)')
