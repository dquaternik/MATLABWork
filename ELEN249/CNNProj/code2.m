% Code 2
function output_fm = code2(input_fm,weights)
    %Layer 1
    N = 3;
    M = 48;
    R = 55;
    C = 55;
    K = 11;
    S = 4;
    output_fm = zeros(M,R,C,'single');

    % off chip
    Tm = 64;
    Tn = 7;
    Tc = 2;
    Tr = 2;

    for row = 1:Tr:R
        for col = 1:Tc:C
            for to = 1:Tm:M
                for ti = 1:Tn:N

                    % On chip
                    trrl = min([row+Tr R]);
                    tccl = min([col+Tc C]);
                    tool = min([to+Tm M]);
                    tiil = min([ti+Tn N]);

                    for trr = row:trrl
                        for tcc = col:tccl
                            for too = to:tool
                                for tii = ti:tiil
                                    for i = 1:K
                                        for j = 1:K
                                            output_fm(too,trr,tcc) = output_fm(too,trr,tcc) + (weights(too,tii,i,j)*input_fm(((S*trr)+i),((S*tcc)+j),tii));
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end

end
