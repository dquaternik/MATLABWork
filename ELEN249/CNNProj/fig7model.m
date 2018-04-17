% Model of figure 7, the computation engine
function output = fig7model(input_fm,output_fm,weights)

    % Assumes that all inputs have been serialized and are proper size

    % variables for number of inputs and outputs
    Tn = 64;
    Tm = 7;
    output = zeros(1,Tm);
    
    count = 1;
    
    
    for j = coder.unroll(1:Tm)
        for i = coder.unroll(1:Tn)
            output(j) = output_fm(j) + input_fm(Tn)*weights(count);
            
            count = count+1;
        end
    end
    
end