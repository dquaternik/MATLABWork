clear
rmin = 2.001
rmax = 3.999
xo = 0.6
num = 400
num2 = num/2;

rmn = round(rmin*1000); %Matlab requires integer subscripts
rmx = round(rmax*1000);
rct = 0; %rct is a counter for the number of r-values interated
for r = rmn:rmx
    x(1)=xo; %set initial condition--Matlab requires subscript > 0
        rdec = r/1000; % converts back to decimal r
    for n=2:num
        x(n)=rdec*(x(n-1))*(1-(x(n-1)));
        if n > num2
            ir = n+(num-2)*rct; %ir is a counter for total interations
            itx(ir) = x(n); %after the first num2 iterations
            rv(ir)=rdec;
        end
    end
    rct=rct+1;
end


plot(rv,itx,'.')
axis([floor(rmin),ceil(rmax),0,1])
numitr = num2str(num);
title(['Bifurcation Diagram for the Logistic Map with Interations = ',numitr])