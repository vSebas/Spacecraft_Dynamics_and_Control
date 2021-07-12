% Concept Check 20 - CRP Differential Kinematic Esuations
% MRP Differential Kinematic Esuations
% Angular velocity to Modified Rodrigues Parameters
clear
clc

% Skew-symmetric matrix / tilde operator
S = @(s) [ 0,    -s(3), s(2);
           s(3),  0,   -s(1);
          -s(2),  s(1),  0 ];

s = [0.4;0.2;-0.1];
s_t = s;
prev_s_dot = [0;0;0];

dt=0.01;
for t = 0:dt:42
    B = (1-norm(s)^2)*eye(3) + 2*S(s) + 2*(s*s'); 
     
    B_t = (1-norm(s)^2)*eye(3) + 2*S(s) + 2*(s*s'); 
      
    omega = [sin(0.1*t); 0.01; cos(0.1*t)]*deg2rad(20);
    
    s_dot = 0.25*B*omega;
    %s_dot_t = 0.5*B_t*omega;
    
    % Mid-point method
    s = s + s_dot*dt;
    
    % Trapezoid method
    %s_t = s_t + (s_dot_t + prev_s_dot)/2*dt;
    %prev_s_dot = s_dot_t;
    
    if norm(s) > 1
       s = -s/(norm(s)^2); 
    end
end

fprintf('%.6f \n',s)
fprintf('%.6f \n',norm(s))