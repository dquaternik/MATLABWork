%% Devon Quaternik
%ELEN 431
%Midterm

close all;
clear;
clc;

%% Problem 3
%Part b
figure;
itr = 1000;
rns = 50;
mu = 0.1;

sign2 = 0.0001;
sigx2 = 1.0;
M = 8;
w = zeros(M,1);
num = [0.8 -.31 -.45 -.8 .25 .55 .1 .9]';
den = [1];
WM = [];
JM = [];


for j=1:rns
    x = sqrt(sigx2)*randn(itr+2*M, 1);
    n = sqrt(sign2)*randn(itr, 1);
    
    g1=filter(num,den,x);
    g2=g1(M:itr+M-1,1);
    d = g2 + n;
        for i = 1:(itr-M+1)
            u = x(i+M-1:-1:i,1);
            y(i,1) = w'*u;
            e(i,1) = d(i,1)-y(i,1);
            J(i,1) = e(i,1)*conj(e(i,1));
            w = w+mu*u*e(i,1);
        end
        WM = [WM w];
        JM = [JM J];
end

W = mean(WM');
LMS = [num W' W'-num]
Y = mean(JM');


tstr='ELEN 431 Midterm Prob. 3 (LMS White noise)'; 
ystr=['Mean Square Error over ',num2str(rns),' runs']; 
xstr='Iterations'; 


semilogy(Y) 
text(0.65,0.90,['step size = ',num2str(mu)],'sc'); 
text(0.65,0.86,['Final weights'],'sc'); 
for i = 1:M    
    text(0.7,(0.85-i*0.03),['w',num2str(i),' : ',num2str(w(i))],'sc') 
end
title(tstr) 
xlabel(xstr) 
ylabel(ystr) 
grid 
%print LMS 
save LMS.mat;

% Leaky LMS 
figure;
itr = 1000;
rns = 50;
mu = 0.1;

sign2 = 0.0001;
sigx2 = 1.0;
M = 8;
w = zeros(M,1);
num = [0.8 -.31 -.45 -.8 .25 .55 .1 .9]';
den = [1];
WM = [];
JM = [];
alph = 0.01;

for j=1:rns
    x = sqrt(sigx2)*randn(itr+2*M, 1);
    n = sqrt(sign2)*randn(itr, 1);
    
    g1=filter(num,den,x);
    g2=g1(M:itr+M-1,1);
    d = g2 + n;
        for i = 1:(itr-M+1)
            u = x(i+M-1:-1:i,1);
            y(i,1) = w'*u;
            e(i,1) = d(i,1)-y(i,1);
            %The difference is here
            J(i,1) = e(i,1)*conj(e(i,1)) + alph.*(w.'*w);
            w = w+mu*u*e(i,1);
        end
        WM = [WM w];
        JM = [JM J];
end

W = mean(WM');
leaky = [num W' W'-num]
Y = mean(JM');


tstr='ELEN 431 Midterm Prob. 3 (Leaky LMS White Noise)'; 
ystr=['Mean Square Error over ',num2str(rns),' runs']; 
xstr='Iterations'; 


semilogy(Y) 
text(0.65,0.90,['step size = ',num2str(mu)],'sc'); 
text(0.65,0.86,['Final weights'],'sc'); 
for i = 1:M    
    text(0.7,(0.85-i*0.03),['w',num2str(i),' : ',num2str(w(i))],'sc') 
end
title(tstr) 
xlabel(xstr) 
ylabel(ystr) 
grid 
%print leaky lms 
save LeakyLMS.mat;

disp('The Leaky LMS has a much larger Mean square error, orders of magnitude larger, but it is far more consistent in achieving the lowest possible. There is almost no noise after a few iterations, where LMS has many');


%Part c
%LMS
figure;
iter = 1000;
num = 20;
mu = 0.01; %Mu must be decrease to account for the coloration or it will not converge

xpower = 1.0;
npower = 0.0001;
M = 8;

w = zeros(M,1);
y = zeros(iter,1);
e = zeros(iter,1);
G=[1 0 -0.9375 0 0.3281 0 0.0244];
B=[0.8 -0.31 -0.45 -0.8 0.25 0.55 0.1 0.9]';
A=[1];
WM = [];
JM = [];

for j = 1:num;

x1 = sqrt(xpower) * randn(iter+2*M, 1);
n = sqrt(npower) * randn(iter, 1);

x = filter(G,A,x1);
g = filter(B,A,x);
g = g(M:iter+M-1, 1);
d = g + n;
	for n = 1:(iter-M+1)
		u = x(n+M-1:-1:n,1);
		y(n,1) = w' * u;
		e(n,1) = d(n,1) - y(n,1);
		J(n,1) = e(n,1) * conj(e(n,1));
		w = w + mu * u * e(n,1);
	end
	WM = [WM w];
	JM = [JM J];
end  
W = mean(WM');
[B  W'  W'-B]
Y = mean(JM');
tstr='ELEN 431 Midterm Prob. 3 (LMS Colored Noise)';
ystr=['Mean Square Error over ',num2str(num),' runs'];
xstr='Iterations';

semilogy(Y)
text(0.65,0.90,['step size = ',num2str(mu)],'sc');
text(0.65,0.86,['Final weights'],'sc');
for i = 1:M
   text(0.7,(0.85-i*0.03),['w',num2str(i),' : ',num2str(w(i))],'sc')
end
title(tstr)
xlabel(xstr)
ylabel(ystr)
grid
%print LMS colored
save LMScolored.mat;


%Leaky LMS
figure;
iter = 1000;
num = 20;
mu = 0.01; %Mu must be decrease to account for the coloration or it will not converge

xpower = 1.0;
npower = 0.0001;
M = 8;

w = zeros(M,1);
y = zeros(iter,1);
e = zeros(iter,1);
G=[1 0 -0.9375 0 0.3281 0 0.0244];
B=[0.8 -0.31 -0.45 -0.8 0.25 0.55 0.1 0.9]';
A=[1];
WM = [];
JM = [];
alph = 0.01; 

for j = 1:num;

x1 = sqrt(xpower) * randn(iter+2*M, 1);
n = sqrt(npower) * randn(iter, 1);

x = filter(G,A,x1);
g = filter(B,A,x);
g = g(M:iter+M-1, 1);
d = g + n;
	for n = 1:(iter-M+1)
		u = x(n+M-1:-1:n,1);
		y(n,1) = w' * u;
		e(n,1) = d(n,1) - y(n,1);
		J(n,1) = e(n,1) * conj(e(n,1)) + alph.*(w.'*w);
		w = w + mu * u * e(n,1);
	end
	WM = [WM w];
	JM = [JM J];
end  
W = mean(WM');
[B  W'  W'-B]
Y = mean(JM');
tstr='ELEN 431 Homework #5 Prob. 2 (COLORED Noise Experiment)';
ystr=['Mean Square Error over ',num2str(num),' runs'];
xstr='Iterations';

semilogy(Y)
text(0.65,0.90,['step size = ',num2str(mu)],'sc');
text(0.65,0.86,['Final weights'],'sc');
for i = 1:M
   text(0.7,(0.85-i*0.03),['w',num2str(i),' : ',num2str(w(i))],'sc')
end
title(tstr)
xlabel(xstr)
ylabel(ystr)
grid
%print hw5_p2
save hw5_p2.mat;

disp('As with the regular LMS, leaky is slower to converge with colored noise. The leaky is still much faster, converging in about half the number of iterations, and is again much more stable once converged. The mean square error remains higher by orders of magnitude.');



%% Problem 4
%Part i
hnum = [0.8 -0.31 -0.45 -0.8 0.25 0.55 0.1 0.9];
hden = [1];
g1num = [0.1 0.2 0.3 0.4 0.4 0.2 0.1];
g1den = [1];
g2num = [0.1 -0.2 -0.3 0.4 0.4 -0.2 -0.1];
g2den = [1];
g3num = [0.1 0.2 0.3 -0.4 0.4 -0.2 0.1];
g3den = [1];

[h1,w1] = freqz(hnum,hden,1000);
[h2,w2] = freqz(g1num,g1den,1000);
[h3,w3] = freqz(g2num,g2den,1000);
[h4,w4] = freqz(g3num,g3den,1000);

figure;
subplot(2,2,1), plot(w1,abs(h1));
title('Frequency respons of H'); xlabel('Frequency (0:2*PI)'); ylabel('Magnitude')
subplot(2,2,2), plot(w2,abs(h2));
title('Frequency respons of G1'); xlabel('Frequency (0:2*PI)'); ylabel('Magnitude')
subplot(2,2,3), plot(w3,abs(h3));
title('Frequency respons of G2'); xlabel('Frequency (0:2*PI)'); ylabel('Magnitude')
subplot(2,2,4), plot(w4,abs(h4));
title('Frequency respons of G3'); xlabel('Frequency (0:2*PI)'); ylabel('Magnitude')

disp('H is a multi-band pass, G1 is LPF, G2 is bandpass over the middle of the spectrum, and G3 is a HPF.');

%Part ii
nIterations = 1000; 
ensemble = 20; 
enserror = [];
ensw     = [];

for j=1:ensemble
    u=wgn(1,nIterations+2*8,0);
    e0=wgn(1,nIterations+2*8,10^-4,'linear');
    input1=filter(g1num,g2den,u);
    desired1=(filter(hnum,hden,input1)+e0).';


    field1='step'; value1=.02;
    field2='filterOrderNo'; value2=7;
    field3='initialCoefficients'; value3=zeros(8,1);
    field4='gamma'; value4=0.01;
    field5='alpha'; value5=0.03;
    field6='initialPower'; value6=1;

    S = struct(field1,value1,field2,value2,field3,value3,field4,value4,field5,value5,field6,value6);

    %DFT
    %G1 Plant
    %   Initialization Procedure
    nCoefficients       =   S.filterOrderNo+1;

    %   Pre Allocations
    errorVector             =   zeros(nIterations   ,1);
    outputVector            =   zeros(nIterations   ,1);
    coefficientVectorDFT    =   zeros(nCoefficients ,(nIterations+1));

    %   Initial State
    coefficientVectorDFT    =   fft(S.initialCoefficients)/sqrt(nCoefficients);
    powerVector             =   S.initialPower*ones(1,nCoefficients);

    %   Improve source code regularity
    prefixedInput           =   [zeros(1,nCoefficients-1) input1];

    %   Body
    for it = 1:nIterations,

        regressorDFT        =   fft(prefixedInput(it+(nCoefficients-1):-1:it))/...
                                sqrt(nCoefficients);

        %   Summing two column vectors
        powerVector         =   S.alpha*(regressorDFT.*conj(regressorDFT))+...
                                (1-S.alpha)*(powerVector);

        outputVector(it,1)  =   (coefficientVectorDFT(:,it)')*regressorDFT.';

        errorVector(it,1)   =   desired1(it)-outputVector(it,1);

        %   Vectorized
        extra=(S.step*conj(errorVector(it,1))*regressorDFT)./(S.gamma+powerVector);
        
        coefficientVectorDFT(:,it+1)=   coefficientVectorDFT(:,it)+(extra.');
        J(it,1) = errorVector(it,1) * conj(errorVector(it,1));

    end

    coefficientVector = ifft(coefficientVectorDFT)*sqrt(nCoefficients);
    enserror = [enserror J];
    ensw     = [ensw coefficientVector(:,1001)];
end

figure;
W = mean(ensw');
[B  W'  W'-B]
Y = mean(enserror');
tstr='ELEN 431 Midterm Prob. 4 (G1)';
ystr=['Mean Square Error over ',num2str(num),' runs'];
xstr='Iterations';

semilogy(Y)
text(0.65,0.90,['step size = ',num2str(S.step)],'sc');
text(0.65,0.86,['Final weights'],'sc');
for i = 1:M
   text(0.7,(0.85-i*0.03),['w',num2str(i),' : ',num2str(coefficientVector(i,1001))],'sc')
end
title(tstr)
xlabel(xstr)
ylabel(ystr)
grid
%print G1
save G1.mat;


%G2
enserror = [];
ensw     = [];

for j=1:ensemble
    u=wgn(1,nIterations+2*8,0);
    e0=wgn(1,nIterations+2*8,10^-4,'linear');
    input2=filter(g2num,g2den,u);
    desired2=(filter(hnum,hden,input2)+e0).';


    field1='step'; value1=.02;
    field2='filterOrderNo'; value2=7;
    field3='initialCoefficients'; value3=zeros(8,1);
    field4='gamma'; value4=0.01;
    field5='alpha'; value5=0.03;
    field6='initialPower'; value6=1;

    S = struct(field1,value1,field2,value2,field3,value3,field4,value4,field5,value5,field6,value6);

    %DFT
    %G1 Plant
    %   Initialization Procedure
    nCoefficients       =   S.filterOrderNo+1;

    %   Pre Allocations
    errorVector             =   zeros(nIterations   ,1);
    outputVector            =   zeros(nIterations   ,1);
    coefficientVectorDFT    =   zeros(nCoefficients ,(nIterations+1));

    %   Initial State
    coefficientVectorDFT    =   fft(S.initialCoefficients)/sqrt(nCoefficients);
    powerVector             =   S.initialPower*ones(1,nCoefficients);

    %   Improve source code regularity
    prefixedInput           =   [zeros(1,nCoefficients-1) input2];

    %   Body
    for it = 1:nIterations,

        regressorDFT        =   fft(prefixedInput(it+(nCoefficients-1):-1:it))/...
                                sqrt(nCoefficients);

        %   Summing two column vectors
        powerVector         =   S.alpha*(regressorDFT.*conj(regressorDFT))+...
                                (1-S.alpha)*(powerVector);

        outputVector(it,1)  =   (coefficientVectorDFT(:,it)')*regressorDFT.';

        errorVector(it,1)   =   desired2(it)-outputVector(it,1);

        %   Vectorized
        extra=(S.step*conj(errorVector(it,1))*regressorDFT)./(S.gamma+powerVector);
        
        coefficientVectorDFT(:,it+1)=   coefficientVectorDFT(:,it)+(extra.');
        J(it,1) = errorVector(it,1) * conj(errorVector(it,1));

    end

    coefficientVector = ifft(coefficientVectorDFT)*sqrt(nCoefficients);
    enserror = [enserror J];
    ensw     = [ensw coefficientVector(:,1001)];
end

figure;
W = mean(ensw');
[B  W'  W'-B]
Y = mean(enserror');
tstr='ELEN 431 Midterm Prob. 4 (G2)';
ystr=['Mean Square Error over ',num2str(num),' runs'];
xstr='Iterations';

semilogy(Y)
text(0.65,0.90,['step size = ',num2str(S.step)],'sc');
text(0.65,0.86,['Final weights'],'sc');
for i = 1:M
   text(0.7,(0.85-i*0.03),['w',num2str(i),' : ',num2str(coefficientVector(i,1001))],'sc')
end
title(tstr)
xlabel(xstr)
ylabel(ystr)
grid
%print G2
save G2.mat;

%G3
enserror = [];
ensw     = [];

for j=1:ensemble
    u=wgn(1,nIterations+2*8,0);
    e0=wgn(1,nIterations+2*8,10^-4,'linear');
    input3=filter(g3num,g3den,u);
    desired3=(filter(hnum,hden,input3)+e0).';


    field1='step'; value1=.02;
    field2='filterOrderNo'; value2=7;
    field3='initialCoefficients'; value3=zeros(8,1);
    field4='gamma'; value4=0.01;
    field5='alpha'; value5=0.03;
    field6='initialPower'; value6=1;

    S = struct(field1,value1,field2,value2,field3,value3,field4,value4,field5,value5,field6,value6);

    %DFT
    %G1 Plant
    %   Initialization Procedure
    nCoefficients       =   S.filterOrderNo+1;

    %   Pre Allocations
    errorVector             =   zeros(nIterations   ,1);
    outputVector            =   zeros(nIterations   ,1);
    coefficientVectorDFT    =   zeros(nCoefficients ,(nIterations+1));

    %   Initial State
    coefficientVectorDFT    =   fft(S.initialCoefficients)/sqrt(nCoefficients);
    powerVector             =   S.initialPower*ones(1,nCoefficients);

    %   Improve source code regularity
    prefixedInput           =   [zeros(1,nCoefficients-1) input3];

    %   Body
    for it = 1:nIterations,

        regressorDFT        =   fft(prefixedInput(it+(nCoefficients-1):-1:it))/...
                                sqrt(nCoefficients);

        %   Summing two column vectors
        powerVector         =   S.alpha*(regressorDFT.*conj(regressorDFT))+...
                                (1-S.alpha)*(powerVector);

        outputVector(it,1)  =   (coefficientVectorDFT(:,it)')*regressorDFT.';

        errorVector(it,1)   =   desired3(it)-outputVector(it,1);

        %   Vectorized
        extra=(S.step*conj(errorVector(it,1))*regressorDFT)./(S.gamma+powerVector);
        
        coefficientVectorDFT(:,it+1)=   coefficientVectorDFT(:,it)+(extra.');
        J(it,1) = errorVector(it,1) * conj(errorVector(it,1));

    end

    coefficientVector = ifft(coefficientVectorDFT)*sqrt(nCoefficients);
    enserror = [enserror J];
    ensw     = [ensw coefficientVector(:,1001)];
end

figure;
W = mean(ensw');
[B  W'  W'-B]
Y = mean(enserror');
tstr='ELEN 431 Midterm Prob. 4 (G3)';
ystr=['Mean Square Error over ',num2str(num),' runs'];
xstr='Iterations';

semilogy(Y)
text(0.65,0.90,['step size = ',num2str(S.step)],'sc');
text(0.65,0.86,['Final weights'],'sc');
for i = 1:M
   text(0.7,(0.85-i*0.03),['w',num2str(i),' : ',num2str(coefficientVector(i,1001))],'sc')
end
title(tstr)
xlabel(xstr)
ylabel(ystr)
grid
%print G3
save G3.mat;


%DCT
%G1
nIterations = 1000; 
ensemble = 20; 
enserror = [];
ensw     = [];

for j=1:ensemble
    u=wgn(1,nIterations+2*8,0);
    e0=wgn(1,nIterations+2*8,10^-4,'linear');
    input1=filter(g1num,g2den,u);
    desired1=(filter(hnum,hden,input1)+e0).';


    field1='step'; value1=.02;
    field2='filterOrderNo'; value2=7;
    field3='initialCoefficients'; value3=zeros(8,1);
    field4='gamma'; value4=0.01;
    field5='alpha'; value5=0.03;
    field6='initialPower'; value6=1;
    
    nCoefficients       =   S.filterOrderNo+1;
    T                   =   dctmtx(nCoefficients);

    %   Pre Allocations
    errorVector             =   zeros(nIterations   ,1);
    outputVector            =   zeros(nIterations   ,1);
    coefficientVectorDCT    =   zeros(nCoefficients ,(nIterations+1));

    %   Initial State
    coefficientVectorDCT    =   T*(S.initialCoefficients);
    powerVector             =   S.initialPower*ones(nCoefficients,1);

    %   Improve source code regularity
    prefixedInput           =   [zeros(nCoefficients-1,1)
                                 transpose(input1)];

    %   Body
    for it = 1:nIterations,

        regressorDCT        =   T*(prefixedInput(it+(nCoefficients-1):-1:it));

        %   Summing two column vectors
        powerVector         =   S.alpha*(regressorDCT.*conj(regressorDCT))+...
                                (1-S.alpha)*(powerVector);

        outputVector(it,1)  =   (coefficientVectorDCT(:,it)')*regressorDCT;

        errorVector(it,1)   =   desired1(it)-outputVector(it,1);

        %   Vectorized
        extra = S.step*conj(errorVector(it,1)*regressorDCT)./(S.gamma+powerVector);
        
        coefficientVectorDCT(:,it+1)=   coefficientVectorDCT(:,it)+(extra);
        
        J(it,1) = errorVector(it,1) * conj(errorVector(it,1));

    end

    coefficientVector = T'*(coefficientVectorDCT);
    enserror = [enserror J];
    ensw     = [ensw coefficientVector(:,1001)];
end

figure;
W = mean(ensw');
[B  W'  W'-B]
Y = mean(enserror');
tstr='ELEN 431 Midterm Prob. 4 (G1 DCT)';
ystr=['Mean Square Error over ',num2str(num),' runs'];
xstr='Iterations';

semilogy(Y)
text(0.65,0.90,['step size = ',num2str(S.step)],'sc');
text(0.65,0.86,['Final weights'],'sc');
for i = 1:M
   text(0.7,(0.85-i*0.03),['w',num2str(i),' : ',num2str(coefficientVector(i,1001))],'sc')
end
title(tstr)
xlabel(xstr)
ylabel(ystr)
grid
%print G1
save G1DCT.mat;


%G2
nIterations = 1000; 
ensemble = 20; 
enserror = [];
ensw     = [];

for j=1:ensemble
    u=wgn(1,nIterations+2*8,0);
    e0=wgn(1,nIterations+2*8,10^-4,'linear');
    input2=filter(g1num,g2den,u);
    desired2=(filter(hnum,hden,input2)+e0).';


    field1='step'; value1=.02;
    field2='filterOrderNo'; value2=7;
    field3='initialCoefficients'; value3=zeros(8,1);
    field4='gamma'; value4=0.01;
    field5='alpha'; value5=0.03;
    field6='initialPower'; value6=1;
    
    nCoefficients       =   S.filterOrderNo+1;
    T                   =   dctmtx(nCoefficients);

    %   Pre Allocations
    errorVector             =   zeros(nIterations   ,1);
    outputVector            =   zeros(nIterations   ,1);
    coefficientVectorDCT    =   zeros(nCoefficients ,(nIterations+1));

    %   Initial State
    coefficientVectorDCT    =   T*(S.initialCoefficients);
    powerVector             =   S.initialPower*ones(nCoefficients,1);

    %   Improve source code regularity
    prefixedInput           =   [zeros(nCoefficients-1,1)
                                 transpose(input2)];

    %   Body
    for it = 1:nIterations,

        regressorDCT        =   T*(prefixedInput(it+(nCoefficients-1):-1:it));

        %   Summing two column vectors
        powerVector         =   S.alpha*(regressorDCT.*conj(regressorDCT))+...
                                (1-S.alpha)*(powerVector);

        outputVector(it,1)  =   (coefficientVectorDCT(:,it)')*regressorDCT;

        errorVector(it,1)   =   desired2(it)-outputVector(it,1);

        %   Vectorized
        extra = S.step*conj(errorVector(it,1)*regressorDCT)./(S.gamma+powerVector);
        
        coefficientVectorDCT(:,it+1)=   coefficientVectorDCT(:,it)+(extra);
        
        J(it,1) = errorVector(it,1) * conj(errorVector(it,1));

    end

    coefficientVector = T'*(coefficientVectorDCT);
    enserror = [enserror J];
    ensw     = [ensw coefficientVector(:,1001)];
end

figure;
W = mean(ensw');
[B  W'  W'-B]
Y = mean(enserror');
tstr='ELEN 431 Midterm Prob. 4 (G2 DCT)';
ystr=['Mean Square Error over ',num2str(num),' runs'];
xstr='Iterations';

semilogy(Y)
text(0.65,0.90,['step size = ',num2str(S.step)],'sc');
text(0.65,0.86,['Final weights'],'sc');
for i = 1:M
   text(0.7,(0.85-i*0.03),['w',num2str(i),' : ',num2str(coefficientVector(i,1001))],'sc')
end
title(tstr)
xlabel(xstr)
ylabel(ystr)
grid
%print G2
save G2DCT.mat;

%G3
nIterations = 1000; 
ensemble = 20; 
enserror = [];
ensw     = [];

for j=1:ensemble
    u=wgn(1,nIterations+2*8,0);
    e0=wgn(1,nIterations+2*8,10^-4,'linear');
    input3=filter(g3num,g3den,u);
    desired3=(filter(hnum,hden,input3)+e0).';


    field1='step'; value1=.02;
    field2='filterOrderNo'; value2=7;
    field3='initialCoefficients'; value3=zeros(8,1);
    field4='gamma'; value4=0.01;
    field5='alpha'; value5=0.03;
    field6='initialPower'; value6=1;
    
    nCoefficients       =   S.filterOrderNo+1;
    T                   =   dctmtx(nCoefficients);

    %   Pre Allocations
    errorVector             =   zeros(nIterations   ,1);
    outputVector            =   zeros(nIterations   ,1);
    coefficientVectorDCT    =   zeros(nCoefficients ,(nIterations+1));

    %   Initial State
    coefficientVectorDCT    =   T*(S.initialCoefficients);
    powerVector             =   S.initialPower*ones(nCoefficients,1);

    %   Improve source code regularity
    prefixedInput           =   [zeros(nCoefficients-1,1)
                                 transpose(input3)];

    %   Body
    for it = 1:nIterations,

        regressorDCT        =   T*(prefixedInput(it+(nCoefficients-1):-1:it));

        %   Summing two column vectors
        powerVector         =   S.alpha*(regressorDCT.*conj(regressorDCT))+...
                                (1-S.alpha)*(powerVector);

        outputVector(it,1)  =   (coefficientVectorDCT(:,it)')*regressorDCT;

        errorVector(it,1)   =   desired3(it)-outputVector(it,1);

        %   Vectorized
        extra = S.step*conj(errorVector(it,1)*regressorDCT)./(S.gamma+powerVector);
        
        coefficientVectorDCT(:,it+1)=   coefficientVectorDCT(:,it)+(extra);
        
        J(it,1) = errorVector(it,1) * conj(errorVector(it,1));

    end

    coefficientVector = T'*(coefficientVectorDCT);
    enserror = [enserror J];
    ensw     = [ensw coefficientVector(:,1001)];
end

figure;
W = mean(ensw');
[B  W'  W'-B]
Y = mean(enserror');
tstr='ELEN 431 Midterm Prob. 4 (G3 DCT)';
ystr=['Mean Square Error over ',num2str(num),' runs'];
xstr='Iterations';

semilogy(Y)
text(0.65,0.90,['step size = ',num2str(S.step)],'sc');
text(0.65,0.86,['Final weights'],'sc');
for i = 1:M
   text(0.7,(0.85-i*0.03),['w',num2str(i),' : ',num2str(coefficientVector(i,1001))],'sc')
end
title(tstr)
xlabel(xstr)
ylabel(ystr)
grid
%print G3
save G3DCT.mat;

%Part iii
disp('The DCT performs best with a high pass filter, as in G3. It consistently converges faster on low and band-pass as well.');

%Part iv
disp('The reason DCT performs better because of the type of input used. Since it stationary, the DCT can take advantage of symmetries that DFT cannot. In doing this, it uses new data that allows it converge more quickly. The DCT generally works better when used on an even function, but any special symmetry helps.')











