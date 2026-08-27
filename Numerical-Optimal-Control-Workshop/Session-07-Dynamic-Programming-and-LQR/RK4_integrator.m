% Written by Mohammadreza Ghobadzadeh
function [ output ] = RK4_integrator(ode_fun, input)
x0 = input.x;
u0 = input.u;
Ts = input.Ts;
nSteps = input.nSteps;
h = Ts / nSteps;
xEnd = x0;
for i = 1:nSteps
    x0 = xEnd;
    xEnd = rk4_step(ode_fun,x0,u0,h);
end
output.value = xEnd;
end

function x_next = rk4_step(ode_fun,x,u,h)
k1 = ode_fun(x,u);
k2 = ode_fun(x+h/2.*k1,u);
k3 = ode_fun(x+h/2.*k2,u);
k4 = ode_fun(x+h.*k3,u);
x_next = x + h/6.*(k1+2*k2+2*k3+k4);
end
