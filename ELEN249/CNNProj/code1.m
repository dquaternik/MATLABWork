% Code 1
function output_fm = code1(input_fm,weights)
    %Layer 1
    N = 3;
    M = 48;
    R = 55;
    C = 55;
    K = 11;
    S = 4;
    output_fm = zeros(M,R,C,'single');


    for row = 1:R
        for col = 1:C
            for to = 1:M
                for ti = 1:N
                    for i = 1:K
                        for j = 1:K
                            output_fm(to,row,col) = output_fm(to,row,col) + (weights(to,ti,i,j)*input_fm(((S*row)+i),((S*col)+j),ti));
                        end
                    end
                end
            end
        end
    end

end