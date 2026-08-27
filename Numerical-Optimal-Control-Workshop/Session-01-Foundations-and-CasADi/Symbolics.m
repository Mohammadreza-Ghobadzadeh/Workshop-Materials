% Written by Mohammadreza Ghobadzadeh
clear 
close all
clc
% Make sure CasADi is installed and added to the MATLAB path.
import casadi.*
% Uncomment the part you want to run
%% Defining symbolics
% x = SX.sym('x');
% disp(x);
% y = MX.sym('y',1,2);
% disp(y);
% z = DM(2);
% disp(z);
%% Arithmetic operations
% x = SX.sym('x');
% y = SX.sym('y',2,2);
% z = sin(y)-x;
% disp(z)
%% Jacobian
% A = SX.sym('A',2,3);
% x = SX.sym('x',3);
% Jaco = jacobian(A*x,x);
% disp(Jaco);
%% Gradient
% A = SX.sym('A',1,3);
% x = SX.sym('x',3,1);
% grad = gradient(A*x,x);
% disp(grad);
%% Hessian
% [H,g] = hessian((A'.*x)'*x,x);
% disp(H)
% disp(g)
