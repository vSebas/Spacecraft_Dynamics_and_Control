% EP Differential Kinematic Equations
% Angular velocity to Euler Parameters
clear
clc

beta = [0.408248;0;0.408248;0.816497];
beta_t = beta;
prev_beta_dot = [0;0;0;0];

dt=0.01;
for t = 0:dt:42
    B = [-beta(2),  -beta(3), -beta(4);
          beta(1),  -beta(4), beta(3);
          beta(4),  beta(1),  -beta(2);
          -beta(3), beta(2),  beta(1)];
      
    B_t = [-beta_t(2),  -beta_t(3), -beta_t(4);
           beta_t(1),  -beta_t(4), beta_t(3);
           beta_t(4),  beta_t(1),  -beta_t(2);
           -beta_t(3), beta_t(2),  beta_t(1)];
      
    omega = [sin(0.1*t); 0.01; cos(0.1*t)]*deg2rad(20);
    
    beta_dot = 0.5*B*omega;
    beta_dot_t = 0.5*B_t*omega;
    
    % Mid-point method
    beta = beta + beta_dot*dt;
    
    % Trapezoid method
    beta_t = beta_t + (beta_dot_t + prev_beta_dot)/2*dt;
    prev_beta_dot = beta_dot_t;
    
    beta = beta/norm(beta);
    beta_t = beta_t/norm(beta_t);
end

fprintf('%.6f \n',beta)
%fprintf('%.6f \n',norm(beta))
fprintf('%.6f \n',beta_t)
%fprintf('%.6f \n',norm(beta_t))

%fprintf('%.6f \n',sqrt(beta(2)^2 + beta(3)^2 + beta(4)^2))