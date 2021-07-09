function C = ypr2dcm(y,p,r)
    % 3-2-1 Euler Angles to DCM
    C = [cos(p)*cos(y) cos(p)*sin(y) -sin(p);
         sin(r)*sin(p)*cos(y)-cos(r)*sin(y) sin(r)*sin(p)*sin(y)+cos(r)*cos(y) sin(r)*cos(p);
         cos(r)*sin(p)*cos(y)+sin(r)*sin(y) cos(r)*sin(p)*sin(y)-sin(r)*cos(y) cos(r)*cos(p)];
end