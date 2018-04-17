%%%%
%%%% ELEN 431 Homework #5 Problem 2 (Colored noise)
%%%%
clear;
iter = input('number of iterations = ');
num = input('number of experiments/runs = ');
mu = input('adaptive step size = ');
xpower = 1.0;
npower = 0.0001;
M = 8;
%%
%% Initialize the weight matrix
%%
w = zeros(M,1);
y = zeros(iter,1);
e = zeros(iter,1);
G=[1 0 -0.9375 0 0.3281 0 0.0244];
B=[0.8 -0.31 -0.45 -0.8 0.25 0.55 0.1 0.9]';
A=[1];
WM = [];
JM = [];
%%
%%	Start the system identification algorithm here
%%
for j = 1:num;
%%
%%	Generate input signal x
%%
x1 = sqrt(xpower) * randn(iter+2*M, 1);
n = sqrt(npower) * randn(iter, 1);
%%
%%	Find the desired input, d
%%
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
end   %%  of j loop for num
W = mean(WM');
[B  W'  W'-B]
Y = mean(JM');
tstr='ELEN 431 Homework #5 Prob. 2 (COLORED Noise Experiment)';
ystr=['Mean Square Error over ',num2str(num),' runs'];
xstr='Iterations';
%%
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
%%print hw5_p2
save hw5_p2.mat;

