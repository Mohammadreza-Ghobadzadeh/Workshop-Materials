% Direct Multiple Shooting — mobile-robot point stabilization
clear; close all; clc
import casadi.*
T = 0.2; N = 10;
v_max = 0.6; omega_max = pi/4;
x = SX.sym('x'); y = SX.sym('y'); theta = SX.sym('theta');
states = [x;y;theta];
v = SX.sym('v'); omega = SX.sym('omega');
controls = [v;omega];
f = Function('f',{states,controls},{[v*cos(theta);v*sin(theta);omega]});
U = SX.sym('U',2,N);
X = SX.sym('X',3,N+1);
P = SX.sym('P',6);
Q = diag([1,5,0.1]); R = diag([0.5,0.05]);
obj = 0; g = X(:,1)-P(1:3);
for k = 1:N
    obj = obj + (X(:,k)-P(4:6))'*Q*(X(:,k)-P(4:6)) + U(:,k)'*R*U(:,k);
    g = [g; X(:,k+1) - (X(:,k) + T*f(X(:,k),U(:,k)))];
end
OPT = [reshape(X,3*(N+1),1); reshape(U,2*N,1)];
solver = nlpsol('solver','ipopt',struct('f',obj,'x',OPT,'g',g,'p',P),struct('ipopt',struct('print_level',0),'print_time',0));
args = struct;
nx = 3*(N+1);
args.lbg = zeros(size(g)); args.ubg = zeros(size(g));
args.lbx = -inf(nx+2*N,1); args.ubx = inf(nx+2*N,1);
args.lbx(1:3:nx) = -2; args.ubx(1:3:nx) = 2;
args.lbx(2:3:nx) = -2; args.ubx(2:3:nx) = 2;
args.lbx(nx+1:2:end) = -v_max; args.ubx(nx+1:2:end) = v_max;
args.lbx(nx+2:2:end) = -omega_max; args.ubx(nx+2:2:end) = omega_max;
x0 = [0;0;0]; xs = [1.5;1.5;0];
X0 = repmat(x0,1,N+1);
sol = solver('x0',[reshape(X0,nx,1);zeros(2*N,1)],'lbx',args.lbx,'ubx',args.ubx,'lbg',args.lbg,'ubg',args.ubg,'p',[x0;xs]);
disp(full(sol.f))
