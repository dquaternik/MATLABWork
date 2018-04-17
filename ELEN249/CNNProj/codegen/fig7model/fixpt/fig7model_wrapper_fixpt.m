%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                          %
%           Generated by MATLAB 8.5 and Fixed-Point Designer 5.0           %
%                                                                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function output = fig7model_wrapper_fixpt(input_fm,output_fm,weights)
    fm = fimath( 'RoundingMethod', 'Floor', 'OverflowAction', 'Wrap', 'ProductMode', 'FullPrecision', 'MaxProductWordLength', 128, 'SumMode', 'FullPrecision', 'MaxSumWordLength', 128 );
    input_fm_in = fi( input_fm, 0, 8, 0, fm );
    output_fm_in = fi( output_fm, 0, 1, 0, fm );
    weights_in = fi( weights, 1, 14, 13, fm );
    [output_out] = fig7model_fixpt( input_fm_in, output_fm_in, weights_in );
    output = double( output_out );
end
