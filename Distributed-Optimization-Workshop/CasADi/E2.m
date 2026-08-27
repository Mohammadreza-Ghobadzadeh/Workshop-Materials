%Written By Hamzeh Kashi Yarandi
clc
clear 
close all

%% Plot Setting
line_width = 1.5;    fontsize_labels = 15;
set(0,'DefaultAxesFontName', 'Times New ')
set(0,'DefaultAxesFontSize', fontsize_labels)

%% Plot Function 
x = 0:0.01:4*pi;
y= sin(x);
set(gcf,'color','white')
plot(x,y,'b', 'linewidth',line_width)
hold on
plot(1.5*pi,-1,'or', 'linewidth',line_width,'MarkerFaceColor','r')
plot(3.5*pi,-1,'or', 'linewidth',line_width,'MarkerFaceColor','r')
grid on
xlabel('x')
ylabel('y')
xlim([-0.1, 4*pi+0.1])
ylim([-1.1,1.1])

%% compose the optimization problem
import casadi.*

x = SX.sym('x'); 
obj = sin(x);
g = [];  
P = [];  
OPT_variables = x;  
nlp_prob = struct('f', obj, 'x', OPT_variables, 'g', g, 'p', P);

opts = struct;
opts.ipopt.max_iter = 1000;
opts.ipopt.print_level = 0; 
opts.print_time = 0; 
opts.ipopt.acceptable_tol =1e-8; 
opts.ipopt.acceptable_obj_change_tol = 1e-6; 
solver = nlpsol('solver', 'ipopt', nlp_prob,opts);

args = struct;
args.lbx = 0;   
args.ubx = 4*pi;    
args.lbg = -inf;  
args.ubg = +inf;  
args.p   =  []; 
args.x0  = 2.6*pi; 

sol = solver('x0', args.x0, 'lbx', args.lbx, 'ubx', args.ubx,...
    'lbg', args.lbg, 'ubg', args.ubg,'p',args.p);
x_optimal = full(sol.x)
f_optimal = full(sol.f)
