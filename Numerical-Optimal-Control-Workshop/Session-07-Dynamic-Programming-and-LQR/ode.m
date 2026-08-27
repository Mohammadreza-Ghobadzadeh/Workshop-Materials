function dx = ode(x,u)
% Nonlinear pendulum dynamics
g = 9.81;
l = 1;
m = 1;
b = 0.1;
dx = [x(2); -(g/l)*sin(x(1)) - (b/(m*l^2))*x(2) + u/(m*l^2)];
end
