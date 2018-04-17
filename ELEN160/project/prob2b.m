x0=1.5;
n=400;
p=.7;

for count1=1:n
        xk1=sequencer(x0,p,n); %gets the sequence for this p
end

    
p2=2;

for count3=1:n
        xk2=sequencer(x0,p2,n); %gets the sequence for this p
end

p3=3.2 

for count4=1:n
        xk3=sequencer(x0,p3,n); %gets the sequence for this p
end

p4=3.9; 

for count5=1:n
        xk4=sequencer(x0,p4,n); %gets the sequence for this p
end


subplot(2,2,1), plot(xk1,'.');
subplot(2,2,2), plot(xk2,'.');
subplot(2,2,3), plot(xk3,'.');
subplot(2,2,4), plot(xk4,'.');