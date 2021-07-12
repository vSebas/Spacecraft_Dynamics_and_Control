clc;
clear;

q_BN = [-0.3;0.3;0.1];
q_FB = [0;0;0];

% Attitude addition of Classical Rodrigues Parameters
%q_FN = (q_FB + q_BN - (cross(q_FB,q_BN)))/(1-(q_FB*q_BN));

q_FN = [0.1;0.2;0.3];
% Attitude subtraction of Classical Rodrigues Parameters
q_FB = (q_FN - q_BN + (cross(q_FN,q_BN)))/(1+(dot(q_FN,q_BN)));

disp(q_FB)