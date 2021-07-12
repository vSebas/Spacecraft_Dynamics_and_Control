function [b] = DCM2EPs(C)
    %Euler parameters from DCM using Sheppard's method
    b0_sqrd = 0.25*(1+trace(C));
    b1_sqrd = 0.25*(1+2*C(1,1)-trace(C));
    b2_sqrd = 0.25*(1+2*C(2,2)-trace(C));
    b3_sqrd = 0.25*(1+2*C(3,3)-trace(C));
   
    [val, idx] = max([b0_sqrd;b1_sqrd;b2_sqrd;b3_sqrd]);
    
    % Don't use 'val', as EPs are not unique
    switch idx
        case 1
            b0 = sqrt(b0_sqrd);
            b1 = (C(2,3)-C(3,2))/(4*b0);
            b2 = (C(3,1)-C(1,3))/(4*b0);
            b3 = (C(1,2)-C(2,1))/(4*b0);
        case 2
            b1 = sqrt(b1_sqrd);
            b0 = (C(2,3)-C(3,2))/(4*b1);
            b2 = (C(1,2)+C(2,1))/(4*b1);
            b3 = (C(3,1)+C(1,3))/(4*b1);
        case 3
            b2 = sqrt(b2_sqrd);
            b0 = (C(3,1)-C(1,3))/(4*b2);
            b1 = (C(1,2)+C(2,1))/(4*b2);
            b3 = (C(2,3)+C(3,2))/(4*b2);
        case 4
            b3 = sqrt(b3_sqrd);
            b0 = (C(1,2)-C(2,1))/(4*b3);
            b1 = (C(3,1)+C(1,3))/(4*b3);
            b2 = (C(2,3)+C(3,2))/(4*b3);
        otherwise
    end
    
    b = [b0;b1;b2;b3];
end