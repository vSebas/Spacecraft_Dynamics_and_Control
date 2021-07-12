clc;
clear;

% Modified Rodrigues Parameters to DCM

% Skew-symmetric matrix / tilde operator
S = @(s) [ 0,    -s(3), s(2);
           s(3),  0,   -s(1);
          -s(2),  s(1),  0 ];

CRPs = [0.1;0.2;0.3];

C = eye(3) + ((8*S(CRPs)^2 - 4*(1-norm(CRPs)^2)*S(CRPs))/(1+norm(CRPs)^2)^2);

disp(C)