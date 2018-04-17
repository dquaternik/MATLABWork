%
%	ADAPTIVE  EQUALIZATION  Part 1  (Uses RLS algorithm)
%	
clear all;
global U P K X H T init lambda delta alpha; 
plots = 4;
B = [2.9 3.1 3.3 3.5];

% Select channel: H1, H2, or default
CHANNEL_MODE = 1;       % 0 - default,  1 - H1(z),  2 - H2(z)

if CHANNEL_MODE > 0
    plots = 1;
end

for l=1:plots

runs = 10; %10;
%runs = input(' enter the number of runs = ');
iterations = 500;
%iterations = input(' enter the number of iterations/run = ');
N = 11;
%B = input(' enter channel bandwidth (2.9,3.1,3.3 or 3.5) = ');
delay = 7;
%delay = input(' enter the delay (5 or 7) = ');
nchannel = 3;
var = 0.001;
%var = input(' enter the noise variance = ');

sqerr = zeros(runs, iterations);
for m=1:runs
%
% 	first generate the r vector, mean=0
%
%	rand('uniform');
	a = sign( 2.0 * (rand(iterations,1) - ones(iterations,1)*0.5));
%
%	rand('normal');
	v = sqrt(var) * randn(iterations,1);
%
%
%
	for n=1:nchannel
		ht(n) = 0.5 * (1.0 + cos(2*pi*(n-2)/B(l)));
	end
	h=[ht(1)  ht(2)  ht(3)];
if (CHANNEL_MODE==1)
    h = [0.35 1 -0.35];
elseif (CHANNEL_MODE==2)
    h = [0.35 1 0.35];
else
    % use default 'h'
end
%
%	generate the output of the channel,  u
%
	u = conv(h,a);
%
%	generate the x input vector 
%
	v = [v' zeros(1,nchannel-1)]';
	x = u + v;
%
%	generate the d input vector 
%
	b = [zeros(1,delay) 1];
	d = filter(b,1,a);
%
%	Initialization
%
	init = 1;
	T = -1;
%
%	Initialize for the algorithm
%
	W = zeros(N,1);
	e = zeros(iterations, 1);
%
%	Now  run the RLS algorithm 
%
	for j = 1:iterations
		  [T,error,W,init] = rls(T,N,d(j),x(j),init);
%W
%pause
%		  outw(1:N,j) = W;
		  e(j) = error;
		  sqerr(m,j) = e(j) * e(j);
	end
	PSIfinal(m) = sqerr(m,iterations);
	WW(1:N,m) = W;
end 
WWW(1:N,l)=mean(WW')';
PSI(l,:) = mean(sqerr);
%W
PSIt(l,:) = mean(sqerr');
end
WF = mean(WWW')';
xl = 'Iterations';
yl = 'PSI';
yt = 'PSIt';

ta = 'Channel Equalization (RLS)  Channel input, a ';
tu = 'Channel Equalization (RLS)  Channel output, u ';
tv = 'Channel Equalization (RLS)  Channel output noise, v ';
tx = 'Channel Equalization (RLS)  Equalizer Input, x ';
ty = 'Channel Equalization (RLS)  Equalizer Output, y ';
te = 'Channel Equalization (RLS)  Output Error';
ts = 'Channel Equalization (RLS)  Ensemble-ave Squared Error';
tt = 'Channel Equalization (RLS)  Time-ave Squared Error';
% % % disp('Ready to plot?'), pause;
% % % tek;
%plot(PSIt),title('Time Averaged error'),xlabel(xl),ylabel(yt);pause;
%plot(p),title(td),xlabel(xl),ylabel('Convolution of a and h');pause;
xaxis=(1:iterations);
figure(1);
if CHANNEL_MODE == 1
    semilogy(xaxis,PSI(1,:),'r-');
    title('RLS Linear Equalization for Channel H1(z), Ensemble Ave error');
elseif CHANNEL_MODE == 2
    semilogy(xaxis,PSI(1,:),'r-');
    title('RLS Linear Equalization for Channel H2(z), Ensemble Ave error');
else
    semilogy(xaxis,PSI(1,:),'-',xaxis,PSI(2,:),':',xaxis,PSI(3,:),'-.', xaxis,PSI(4,:),'--');
    title('RLS Linear Equalization for 4 diff channels Ensemble Ave error');
    legend('W=2.9','W=3.1','W=3.3','W=3.5');
end
hold on;
xlabel(xl),ylabel(yl); %pause;
%semilogy(PSI(1,:)),hold,
%for l=2:plots
%	semilogy(PSI(l,:));
%end
%title(ts),xlabel(xl),
%ylabel('Ensemble-ave sq error ');
%psplot('rlsplots');
%hold;
%WF;
%save W.mat WF;
save rls.mat;
%plot(a),title(ta),xlabel(xl),ylabel('channel input');pause;
%plot(u),title(tu),xlabel(xl),ylabel('channel output');pause;
%plot(v),title(tv),xlabel(xl),ylabel('channel output noise');pause;
%plot(x),title(tx),xlabel(xl),ylabel('equalizer input');pause;
%plot(y),title(ty),xlabel(xl),ylabel('equalizer output');pause;
%plot(e),title(te),xlabel(xl),ylabel('output error');pause;

%semilogy(mean(sqerr')),title(tt),xlabel(xl),ylabel('Time-ave sq error in dB');
%pause;


