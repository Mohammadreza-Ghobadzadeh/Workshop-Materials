% Written by Mohammadreza Ghobadzadeh
clear
close all
clc
% Make sure CasADi is installed and added to the MATLAB path.
import casadi.*
% Uncomment the part you want to run
%% Function objects, root finding, ODE (CVODES), DAE (IDAS)
% See the session README and recorded lecture for the section-by-section walkthrough.
% x = SX.sym('x'); y = SX.sym('y');
% f = Function('f',{x,y},{x,sin(y)*x},{'x','y'},{'r','q'});
% [r0, q0] = f(1.1,3.3);
% z = SX.sym('z',1); x = SX.sym('x',1);
% g = Function('g',{[z;x]},{[sin(x+z);cos(x-z)]});
% G = rootfinder('G','newton',g);
% root = G([0.1,0.2]);
% t = SX.sym('t'); y = SX.sym('y');
% integrator_ode = integrator('integrator','cvodes',struct('x',y,'t',t,'ode',-y),struct('tf',5));
% sol = integrator_ode('x0',1);
% x = SX.sym('x'); z = SX.sym('z'); p = SX.sym('p');
% dae = struct('x',x,'z',z,'p',p,'ode',z+p,'alg',z-x);
% integrator_dae = integrator('integrator','idas',dae,struct('t0',0,'tf',1));
% sol = integrator_dae('x0',0,'z0',0,'p',0.1);
