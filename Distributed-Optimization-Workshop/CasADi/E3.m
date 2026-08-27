%Written By Hamzeh Kashi Yarandi
clc
clear
close all

%% Plot Setting 
line_width = 1.5;    fontsize_labels = 15;
set(0,'DefaultAxesFontName', 'Times New Roman')
set(0,'DefaultAxesFontSize', fontsize_labels)

%% Plot Function 
x = [0,45,90,135,180];
y = [95,89,183,297,636];

figure()
set(gcf,'color','white')
plot(x,y,'*b', 'linewidth',line_width); 
hold on
xlabel('x')
ylabel('y')
grid on

%% compose the optimization problem
import casadi.*

m = SX.sym('m');
c = SX.sym('c');
obj = 0;
for i = 1:length(x)
    obj = obj+ (y(i) - (m*x(i)+c))^2; 
end
g = [];  
P = [];  
OPT_variables = [m;c];
nlp_prob = struct('f', obj, 'x', OPT_variables, 'g', g, 'p', P);

opts = struct;
opts.ipopt.max_iter = 1000;
opts.ipopt.print_level = 0; 
opts.print_time = 0; 
opts.ipopt.acceptable_tol =1e-8; 
opts.ipopt.acceptable_obj_change_tol = 1e-6; 
solver = nlpsol('solver', 'ipopt', nlp_prob,opts);

args = struct;
args.lbx = -inf;  
args.ubx = +inf;   
args.lbg = -inf;  
args.ubg = +inf;   
args.p   = []; 
args.x0  = [2;1]; 

sol = solver('x0', args.x0, 'lbx', args.lbx, 'ubx', args.ubx,...
    'lbg', args.lbg, 'ubg', args.ubg,'p',args.p);

x_sol = full(sol.x)
min_value = full(sol.f)
x_line = [0:1:180];
m_sol = x_sol(1)
c_sol = x_sol(2)
y_line = m_sol*x_line+c_sol;

figure()
set(gcf,'color','w')
plot(x,y,'*b', 'linewidth',line_width); 
hold on
plot(x_line,y_line,'-k', 'linewidth',line_width)
legend(['Data points', 'y =' , num2str(m_sol), 'x +', num2str(c_sol)])
xlabel('x')
ylabel('y')
grid on
