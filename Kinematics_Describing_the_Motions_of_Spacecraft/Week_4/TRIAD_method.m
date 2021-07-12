% Deterministic Attitude Estimation
% Vector Triad Method
% Concept check 2 Week 4
clear;
clc;

% Two sensor measurements in body frame. First sensor is more accurate.
v1_b = [0.8273; 0.5541; -0.0920];
v2_b = [-0.8285; 0.5522; -0.0955];
v1_b = v1_b/norm(v1_b);
v2_b = v2_b/norm(v2_b);

% Same measurements in inertial frame
v1_n = [-0.1517; -0.9669; 0.205];
v2_n = [-0.8393; 0.4494; -0.3044];

% Body frame triad vectors
t1_b = v1_b;
t2_b = cross(v1_b,v2_b)/norm(cross(v1_b,v2_b));
t2_b = t2_b/norm(t2_b);
t3_b = cross(t1_b,t2_b);

% Inertial frame triad vectors
t1_n = v1_n;
t2_n = cross(v1_n,v2_n)/norm(cross(v1_n,v2_n));
t2_n = t2_n/norm(t2_n);
t3_n = cross(t1_n,t2_n);

BT = [t1_b, t2_b, t3_b];
NT = [t1_n, t2_n, t3_n];

% Estimated attitude
BN = BT*(NT');

disp(BN)

BN = [0.969846,  0.17101,   0.173648;
      -0.200706, 0.96461,   0.17101;
      -0.138258, -0.200706, 0.969846];
  
% True BN
BN_t = [0.963592,  0.187303,  0.190809;
        -0.223042, 0.956645,  0.187303;
        -0.147454, -0.223042, 0.963592];

% B to true B
B_bt = BN*(BN_t');

disp(B_bt)

% DCM to PRV
phi = acos(0.5*(trace(B_bt) - 1));
e = 1/(2*sin(phi)) * [B_bt(2,3) - B_bt(3,2);
                      B_bt(3,1) - B_bt(1,3);
                      B_bt(1,2) - B_bt(2,1)];

disp(rad2deg(phi))
                  