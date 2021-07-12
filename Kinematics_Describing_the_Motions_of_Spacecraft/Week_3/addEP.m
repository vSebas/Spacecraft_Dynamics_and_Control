function FN = addEP(FB,BN)
    % Euler Parameters addition
    FN = [FB(1) -FB(2) -FB(3) -FB(4);
          FB(2) FB(1) FB(4) -FB(3);
          FB(3) -FB(4) FB(1) FB(2);
          FB(4) FB(3) -FB(2) FB(1)]*[BN(1); BN(2); BN(3); BN(4)];
end