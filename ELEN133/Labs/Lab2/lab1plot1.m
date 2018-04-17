function [ ] = lab1plot1( t, h, s, ix )
% inputs: a time vector (t), two input vectors (h and s); subplot index (ix)
% The two input vectors are plotted in different colors on the same axes against the time vector, t,
% in subplot ix of a 2x2 subplot array.

subplot(2,2,ix), plot(t,h,t,s);
end
