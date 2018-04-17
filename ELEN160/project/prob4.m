x0=.5;
n=500;
p=3.82394; %this is the value that gives one disturbance around k=375

for count1=1:n
        xk1=sequencer(x0,p,n); %gets the sequence for this p
end

plot(xk1,'.');