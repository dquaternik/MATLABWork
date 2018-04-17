%% Devon Quaternik
%% ELEN 431
%% HW 5

%% Problem 1
figure;
itr = 1000;
rns = 20;
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
[num W' W'-num]
Y = mean(JM');


tstr='ELEN 431 Homework #5 Prob. 1 (WHITE Noise Experiment)'; 
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
%print hw5_p1 
save hw5_p1.mat;


%% Problem 2
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

disp('the final weight vector is very close in both cases, but that is due to decreasing the step size to accommadate the coloration of the noise. When run with the same parameters as white, the answer is nonconvergent.')
