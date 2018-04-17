function [y] = my_linconv(x, h)
% y = my_linconv(x,h) performs a linear convolution of x and h by:
% 1) zero padding each to the appropriate length
% 2) performing the fft() of each
% 3) multiplying the fft's
% 4) performing the ifft

% Determine the lengths of each sequence and the length of the linear
% convolution.
x_length=length(x);
h_length=length(h);
% TASK ONE: Replace ANSWER1 with the appropriate formula to make this
% function work.  It should be based on the above values.
conv_length=x_length-h_length+1;

% Zero pad each sequence to the ?????????????????
% TASK TWO: Replace ANSWER2 with the appropriate formula to make this 
% function work. It should be based on the above values.
new_x = [x zeros(1,(conv_length-x_length))];

% TASK THREE: Replace ANSWER3 with the appropriate formula to make this
% function work. It should be based on the above values.
new_h = [h zeros(1,(conv_length-h_length))];

% Obtain the DFT of each zero padded sequence
fft_new_x = fft(new_x);
fft_new_h = fft(new_h);

% Multiply the DFTs obtained in the previous step
fft_y = fft_new_x.*fft_new_h;

% Determine the inverse DFT to obtain the linear convolution
y = ifft(fft_y);

end
