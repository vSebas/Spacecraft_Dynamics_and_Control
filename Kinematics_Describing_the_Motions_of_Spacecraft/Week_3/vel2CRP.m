% Concept Check 13 - CRP Differential Kinematic Equations
% CRP Differential Kinematic Equations
% Angular velocity to Classical Rodrigues Parameters
clear
clc

q = [0.4;0.2;-0.1];
q_t = q;
prev_q_dot = [0;0;0];

dt=0.01;
for t = 0:dt:42
    B = [1+q(1)^2,       q(1)*q(2)-q(3), q(1)*q(3)+q(2);
         q(2)*q(1)+q(3), 1+q(2)^2,       q(2)*q(3)-q(1);
         q(3)*q(1)-q(2), q(3)*q(2)+q(1), 1+q(3)^2]; 
     
    B_t = [1+q(1)^2,       q(1)*q(2)-q(3), q(1)*q(3)+q(2);
         q(2)*q(1)+q(3), 1+q(2)^2,       q(2)*q(3)-q(1);
         q(3)*q(1)-q(2), q(3)*q(2)+q(1), 1+q(3)^2];
      
    omega = [sin(0.1*t); 0.01; cos(0.1*t)]*deg2rad(3);
    
    q_dot = 0.5*B*omega;
    %q_dot_t = 0.5*B_t*omega;
    
    % Mid-point method
    q = q + q_dot*dt;
    
    % Trapezoid method
    %q_t = q_t + (q_dot_t + prev_q_dot)/2*dt;
    %prev_q_dot = q_dot_t;
end

fprintf('%.6f \n',q)
fprintf('%.6f \n',norm(q))