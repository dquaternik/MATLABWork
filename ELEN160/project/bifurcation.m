pmin=0.001;  %matlab indices must start above 0 
pmax=3.999;
x0=0.5;      %chosen x0
n=400;       %chosen length of sequence

p2=round(pmax*1000);
count=1;
px=zeros(1,n);

while count<p2
    pin=count/1000; %go back to decimal p
    for count1=1:n
        xk=sequencer(x0,pin,n); %gets the sequence for this p
        if count1>(n/2)         %removes first half to avoid transients
            count2=count1+(n-2)*count; %counts all the iterations
            iter(count2)=xk(count1);   
            px(count2)=pin;
        end
    end
    count=count+1;
end

plot(px,iter,'.','MarkerSize',2);
axis([floor(pmin),ceil(pmax),0,1])