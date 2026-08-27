%Written By Hamzeh Kashi Yarandi
clc
clear 
close all

%% Plot Setting 
line_width = 1.5;    fontsize_labels = 15;
set(0,'DefaultAxesFontName', 'Times New Roman')
set(0,'DefaultAxesFontSize', fontsize_labels)

%% Plot Function 
x = 1:0.1:5 ;
y = x.^2-6*x+13;
xmin=3; ymin=4;

figure()
set(gcf,'color','white')
plot(x,y,'b', 'linewidth',line_width)
hold on
plot(xmin,ymin,'or', 'linewidth',line_width,'MarkerFaceColor','r')
grid on
xlabel('x')
ylabel('y')
xlim([0, 6])
ylim([2,10])

%% compose the optimization problem
import casadi.*

%Part 1
x = SX.sym('x');
%Part 2
obj = x^2-6*x+13 ;
%Part 3 
g = [];
P = [];

%Part 4
OPT_variables = x;
nlp_prob = struct('f', obj, 'x', OPT_variables, 'g', g, 'p', P);

opts = struct;
opts.ipopt.max_iter = 1000;
opts.ipopt.print_level = 0;
opts.print_time = 0;
opts.ipopt.acceptable_tol =1e-8;
opts.ipopt.acceptable_obj_change_tol = 1e-6; 

solver = nlpsol('solver', 'ipopt', nlp_prob,opts);

%Part 5
args = struct;
args.lbx = -inf;
args.ubx = +inf;
args.lbg = -inf;
args.ubg = +inf;
args.p   =  [];
args.x0  = -0.5;

sol = solver('x0', args.x0, 'lbx', args.lbx, 'ubx', args.ubx,...
    'lbg', args.lbg, 'ubg', args.ubg,'p',args.p);

%Part 6
x_optimal = full(sol.x)
f_optimal = full(sol.f)
