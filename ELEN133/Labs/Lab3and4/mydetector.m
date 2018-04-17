function [y,b,Wn,ex1] = mydetector(signal)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

fs = 8000;  %sampling frequency
N1 = 100;   %Filter order
w = 40;     %1/2 of width of notch
seg_width=100;
seg_step=0.5*(seg_width);
freq_step=fs/seg_width;
flag1 = 0;


row_freq=[697 770 852 941];
col_freq=[1209, 1336, 1477];

for i = 1:length(row_freq)
    Wn(i,:)=[row_freq(i)-w,row_freq(i)+w]/(fs/2);
end
for j = 1:length(col_freq)
    Wn(i+j,:)=[col_freq(j)-w,col_freq(j)+w]/(fs/2);
end
for k = 1:(i+j)
    b(k,:) = fir1(N1,Wn(k,:),rectwin(N1+1));
    y(k,:) = filter(b(k,:),1,signal);
end

% Find two rows that are high (>0.3)
for l = 1:length(y)
    for k = 1:(i+j)
        if y(k,l)>0.3 && flag1 == 0
            ex1(l,1) = k;
            flag1 = 1;
        elseif y(k,l)>0.3 && flag1 == 1
            ex1(l,2) = k;
            flag1 = 0;
        end
    end
end
        



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

