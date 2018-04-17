function [y] = my_cp_conv(x, h)
% y = my_cp_conv(x,h) determines the circular convolution by:
% 1) applying the cyclic prefix to the longer sequence
% 2) Performing the linear convolution of the two sequences
% 3) Taking the center N points

% Determine the lengths of each sequence.
x_length=length(x);
h_length=length(h);

% Take the last M-1 terms of the longer sequence (where M is the length of
% the shorter sequence) and append to the front of the longer sequence.
if x_length>h_length
    % TASK SIX: Replace ANSWER6 with the appropriate formula to make this 
    % function work. It should be based on the above values.
    new_x = [x((x_length-h_length+1):x_length)  x];
    new_h = h;
else
    if x_length<h_length
        % TASK SEVEN: Replace ANSWER7 with the appropriate formula to make this 
        % function work. It should be based on the above values.
        new_h = [h((h_length-x_length+1):h_length)  h];
        new_x = x;
    end
end

% Take the linear convolution of the two new sequences.
y_temp=my_linconv(new_x,new_h);

% Take the appropriate samples from the above linear convolution to obtain
% the circular convolution.
y=y_temp(min(x_length,h_length):x_length+h_length-1);

end