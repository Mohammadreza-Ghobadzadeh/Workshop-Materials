% Written by Mohammadreza Ghobadzadeh
function LQR_design(Q,R)
% creates LQR feedback matrix for linearized discrete time system
A = [1.0050, 0.1002; 0.1002, 1.0050];
B = [0.0050; 0.1002];
[K,P] = dlqr(A,B,Q,R);
save lqr.mat A B Q R K P
end
