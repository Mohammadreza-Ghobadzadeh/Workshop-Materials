% Direct Single Shooting — mobile-robot point stabilization
clear; close all; clc
import casadi.*
T = 0.2; N = 20;
v_max = 0.6; omega_max = pi/4;
x = SX.sym('x'); y = SX.sym('y'); theta = SX.sym('theta');
states = [x;y;theta];
v = SX.sym('v'); omega = SX.sym('omega');
controls = [v;omega];
f = Function('f',{states,controls},{[v*cos(theta);v*sin(theta);omega]});
U = SX.sym('U',2,N);
P = SX.sym('P',6);
X = SX.sym('X',3,N+1);
X(:,1) = P(1:3);
for k = 1:N
    X(:,k+1) = X(:,k) + T*f(X(:,k),U(:,k));
end
Q = diag([1,5,0.1]); R = diag([0.5,0.05]);
obj = 0; g = [];
for k=1:N
    obj = obj + (X(:,k)-P(4:6))'*Q*(X(:,k)-P(4:6)) + U(:,k)'*R*U(:,k);
end
for k=1:N+1
    g = [g; X(1,k); X(2,k)];
end
solver = nlpsol('solver','ipopt',struct('f',obj,'x',reshape(U,2*N,1),'g',g,'p',P),struct('ipopt',struct('print_level',0),'print_time',0));
args = struct;
args.lbg = -2; args.ubg = 2;
args.lbx(1:2:2*N-1,1) = -v_max; args.ubx(1:2:2*N-1,1) = v_max;
args.lbx(2:2:2*N,1) = -omega_max; args.ubx(2:2:2*N,1) = omega_max;
x0 = [0;0;0]; xs = [1.5;1.5;0];
sol = solver('x0', zeros(2*N,1), 'lbx', args.lbx, 'ubx', args.ubx, 'lbg', args.lbg, 'ubg', args.ubg, 'p', [x0;xs]);
u = reshape(full(sol.x),2,N);
disp(u)
