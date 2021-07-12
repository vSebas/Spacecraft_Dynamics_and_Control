function FB = subtractEP(FN,BN)
    % Euler parameters subtraction
    FB = transpose([BN(1) -BN(2) -BN(3) -BN(4);
                    BN(2) BN(1) -BN(4) BN(3);
                    BN(3) BN(4) BN(1) -BN(2);
                    BN(4) -BN(3)  BN(2) BN(1)]) * [FN(1); FN(2); FN(3); FN(4)];
end