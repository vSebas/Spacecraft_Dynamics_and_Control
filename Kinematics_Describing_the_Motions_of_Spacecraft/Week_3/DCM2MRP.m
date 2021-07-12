clc;
clear;

% Direction Cosine Matrix to Modified Rodrigues Parameters
C = [0.763314,  0.0946746, -0.639053;
     -0.568047, -0.372781, -0.733728;
     -0.3076920, 0.923077, -0.230769];

%quats = DCM2EPs(C);

dseta = sqrt(trace(C)+1); % = 2*beta0

MRPs = 1/(dseta*(dseta+2)) * [C(2,3)-C(3,2);
                             C(3,1)-C(1,3);
                             C(1,2)-C(2,1)];

disp(MRPs);