clear
clc
% Concept check #9 euler angle differential equation
% Problem #2

% Initial conditions
psi0 = deg2rad(40); % Yaw
theta0 = deg2rad(30); % Pitch
phi0 = deg2rad(80); % Roll
X = [psi0; theta0; phi0]; % State vector
dt = 0.01; % Time-step
T = 60; % Total time (s)

for t = 0:dt:T
    w = [sin(0.1*t);0.01;cos(0.1*t)]*deg2rad(20); % Angular velocity components
    B = (1/cos(X(2)))* [0          sin(X(3))                       cos(X(3));
                         0          cos(X(3))*cos(X(2))   -sin(X(3))*cos(X(2));
                         cos(X(2)) sin(X(3))*sin(X(2))  cos(X(3))*sin(X(2))];
    X = X + B*w*dt;
    
    if t == 42
        disp(norm(X));
    end           
end