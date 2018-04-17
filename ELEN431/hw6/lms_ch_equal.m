%
%	ELEN 431 SANTA CLARA UNIVERSITY
%	ADAPTIVE  EQUALIZATION  Part 1  (Uses LMS alg.)
%	
%
clear all;
plots = 4;
runs = 20;
iterations = 400;
N = 11;
B = [2.9 3.1 3.3 3.5];
delay = 7;
nchannel = 3;
mu = 0.075;
var = 0.001;


for l=1:plots
sqerr = zeros(runs, iterations);
for m=1:runs
%
% 	first generate the a and v vectors
%
a = sign( 2.0 * (rand(iterations,1) - ones(iterations,1)*0.5));
v = sqrt(var) * randn(iterations,1);
%
for n=1:nchannel
	ht(n) = 0.5 * (1.0 + cos(2*pi*(n-2)/B(l)));
end
h=[ht(1)  ht(2)  ht(3)];
%
%	generate the output of the channel,  u
%
u = conv(h,a);
%
%	generate the x input vector 
%
v = [v; zeros(nchannel-1,1)];
x = u + v;
%
%	generate the d input vector 
%
	b = [zeros(1,delay) 1];
	d = filter(b,1,a);
%
%	Initialize for the algorithm
%
	W = zeros(N,1);
	e = zeros(iterations, 1);
	y = zeros(iterations, 1);
%
%	Now  run the LMS algorithm 
%
	for j = 1:N
	   y(j,1) = W(1:j,1)' * x(j:-1:1);
	   e(j,1) = d(j,1) - y(j,1);
	   W(1:j,1) = W(1:j,1) + mu*e(j,1)*x(j:-1:1);
	   sqerr(m,j) = e(j,1) * e(j,1);
	end
	for j = N+1:iterations
	   y(j,1) = W' * x(j:-1:j-N+1);
	   e(j,1) = d(j,1) - y(j,1);
	   W = W + mu*e(j,1)*x(j:-1:j-N+1);
	   sqerr(m,j) = e(j,1) * e(j,1);
	end
   PSIfinal(m) = sqerr(m,iterations);
   WW(1:N,m) = W;
end 
PSI(l,:) = mean(sqerr);
PSIt(l,:) = mean(sqerr');
end
xl = 'Iterations';
yl = 'PSI';
yt = 'PSIt';
ts = 'Channel Equalization (LMS)  Ensemble-ave Squared Error';
xaxis=(1:length(PSI));
figure;
semilogy(xaxis,PSI(1,:),xaxis,PSI(2,:),xaxis,PSI(3,:),xaxis,PSI(4,:)),
title(ts),ylabel('dB '),xlabel(xl),
legend('W=2.9','W=3.1','W=3.3','W=3.5');


%Part 2
clear all;
plots = 4;
runs = 20;
iterations = 400;
N = 11;
B = [2.9 3.1 3.3 3.5];
delay = 7;
nchannel = 3;
mu = 0.075;
var1 = 0.001;


for l=1:plots
sqerr = zeros(runs, iterations);
for m=1:runs
%
% 	first generate the a and v vectors
%
a = sign( 2.0 * (rand(iterations,1) - ones(iterations,1)*0.5));
v = sqrt(var1) * randn(iterations,1);
%
for n=1:nchannel
	ht(n) = 0.5 * (1.0 + cos(2*pi*(n-2)/B(l)));
end
h=[ht(1)  ht(2)  ht(3)];

h1 = [0.35 1 -0.35];
h2 = [0.35 1 0.35];
%
%	generate the output of the channel,  u
%
u = conv(h1,a);
%
%	generate the x input vector 
%
v = [v; zeros(nchannel-1,1)];
x = u + v;
%
%	generate the d input vector 
%
	b = [zeros(1,delay) 1];
	d = conv(h2,a);
%
%	Initialize for the algorithm
%
	W = zeros(N,1);
	e = zeros(iterations, 1);
	y = zeros(iterations, 1);
%
%	Now  run the LMS algorithm 
%
	for j = 1:N
	   y(j,1) = W(1:j,1)' * x(j:-1:1);
	   e(j,1) = d(j,1) - y(j,1);
	   W(1:j,1) = W(1:j,1) + mu*e(j,1)*x(j:-1:1);
	   sqerr(m,j) = e(j,1) * e(j,1);
	end
	for j = N+1:iterations
	   y(j,1) = W' * x(j:-1:j-N+1);
	   e(j,1) = d(j,1) - y(j,1);
	   W = W + mu*e(j,1)*x(j:-1:j-N+1);
	   sqerr(m,j) = e(j,1) * e(j,1);
	end
   PSIfinal(m) = sqerr(m,iterations);
   WW(1:N,m) = W;
end 
PSI(l,:) = mean(sqerr);
PSIt(l,:) = mean(sqerr');
end
xl = 'Iterations';
yl = 'PSI';
yt = 'PSIt';
ts = 'MSE equalizing H1 to H2';
xaxis=(1:length(PSI));
figure(2);
semilogy(xaxis,PSI(1,:)),
title(ts),ylabel('dB '),xlabel(xl)
legend('RLS','LMS');
