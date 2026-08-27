function [K, P] = LQR_design(A, B, Q, R)
% Discrete-time LQR gain and Riccati solution.
[K, P] = dlqr(A, B, Q, R);
end
