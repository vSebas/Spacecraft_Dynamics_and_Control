clc;
clear;

s_BN = [0.1;0.2;0.3];
s_FB = [-0.1;0.3;0.1];


% Attitude addition of Modified Rodrigues Parameters
%s_FN = ((1-norm(s_BN)^2)*s_FB + (1-norm(s_FB)^2)*s_BN - cross(2*s_FB,s_BN))/...
%        ( 1+norm(s_BN)^2 * norm(s_FB)^2 - 2*dot(s_BN,s_FB) );

s_FN = [0.5;0.3;0.1];
% Attitude subtraction of Modified Rodrigues Parameters
s_FB = ((1-norm(s_BN)^2)*s_FN - (1-norm(s_FN)^2)*s_BN + cross(2*s_FN,s_BN))/...
        ( 1+norm(s_BN)^2 * norm(s_FN)^2 + 2*dot(s_BN,s_FN) );

disp(s_FB)