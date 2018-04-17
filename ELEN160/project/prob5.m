x0=.5;
n=500;
p=3.9; 

for count1=1:n
        xk1=sequencer(x0,p,n); %gets the sequence for this p
end

x01=.50000001;
for count1=1:n
        xk2=sequencer(x01,p,n); %gets the sequence for this p
end
xk=xk1-xk2;
plot(xk,'.');