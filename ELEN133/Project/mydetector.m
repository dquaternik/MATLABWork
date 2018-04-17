function Y = mydetector(x, smoothLength)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

xa=abs(x);
b=(ones(1, smoothLength))/smoothLength;
Y=filter(b,1,xa);
%t=1:length(smoothxa);
%plot(t,smoothxa);

%for t=1:length(smoothxa)
%    if smoothxa(t)>=.1
%        Y(t)=smoothxa(t);
%    else
%        Y(t)=0;
%    end
%end


end

