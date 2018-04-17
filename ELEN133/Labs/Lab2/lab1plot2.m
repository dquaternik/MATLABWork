function [] = lab1plot2(t,y1,y2,y3,f1,f2,f3,ix)
% inputs:a time vector (t), three vectors (y1,y2,y3); three associated frequency values (f1,f2,f3);
% and subplot index (ix)
% The three input vectors are plotted in different colors on the same axes against the time
% vector, t,in subplot ix of a 2x2 subplot array. The frequency values are printed in the plot title



subplot(2,2,ix), plot(t,y1,t,y2,t,y3);
title(['Responses for freq:' num2str(f1) ',' num2str(f2) ',' num2str(f3)]);
end

