function [b0,b1,b2,b3] = dcm2ep(C)
    %Euler parameters from DCM
    b0_2 = 0.25*(1+trace(C));
    b1_2 = 0.25*(1+2*C(1,1)-trace(C));
    b2_2 = 0.25*(1+2*C(2,2)-trace(C));
    b3_2 = 0.25*(1+2*C(3,3)-trace(C));
   
    [val, idx] = max([b0_2;b1_2;b2_2;b3_2]);
    
    switch val
        case b0_2
            b0 = sqrt(b0_2);
            b1 = (C(2,3)-C(3,2))/(4*b0);
            b2 = (C(3,1)-C(1,3))/(4*b0);
            b3 = (C(1,2)-C(2,1))/(4*b0);
        case b1_2
            b1 = sqrt(b1_2);
            b0 = (C(2,3)-C(3,2))/(4*b1);
            b2 = (C(1,2)+C(2,1))/(4*b1);
            b3 = (C(3,1)+C(1,3))/(4*b1);
        case b2_2
            b2 = sqrt(b2_2);
            b0 = (C(3,1)-C(1,3))/(4*b2);
            b1 = (C(1,2)+C(2,1))/(4*b2);
            b3 = (C(2,3)+C(3,2))/(4*b2);
        case b3_2
            b3 = sqrt(b3_2);
            b0 = (C(1,2)-C(2,1))/(4*b3);
            b1 = (C(3,1)+C(1,3))/(4*b3);
            b2 = (C(2,3)+C(3,2))/(4*b3);
        otherwise
    end
end