function [y] = my_circconv(x, h)
% y = my_circonv(x,h) performs a circular convolution of x and h by:
% 1) zero padding the shorter to the appropriate length
% 2) performing the fft() of each
% 3) multiplying the fft's
% 4) performing the ifft

% Determine the lengths of each sequence.
x_length=length(x);
h_length=length(h);

% Zero pad the shorter of the two sequences to ????????????.
if x_length>h_length
    % TASK FOUR: Replace ANSWER4 with the appropriate formula to make this 
    % function work. It should be based on the above values.
    h = [h zeros(1,(x_length-h_length))];
else
    if x_length<h_length
        % TASK FIVE: Replace ANSWER5 with the appropriate formula to make this 
        % function work. It should be based on the above values.
        x = [x zeros(1,0)];
    end
end

% Obtain the DFT of each zero padded sequence
fft_x = fft(x);
fft_h = fft(h);

% Multiply the DFTs obtained in the previous step
fft_y = fft_x.*fft_h;

% Determine the inverse DFT to obtain the circular convolution
y = ifft(fft_y);

end