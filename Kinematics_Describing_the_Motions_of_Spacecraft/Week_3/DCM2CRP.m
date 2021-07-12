clc;
clear;

% Direction Cosine Matrix to Classical Rodrigues Parameters
C = [0.333333,  0.871795, -0.358974;
     -0.666667, 0.487179, 0.564103;
     0.666667,  0.0512821, 0.74359]';
 
dseta = sqrt(trace(C)+1); % = 2*beta0

q = 1/(dseta^2) * [C(2,3) - C(3,2);
                   C(3,1) - C(1,3);
                   C(1,2) - C(2,1)];
   
disp(q);