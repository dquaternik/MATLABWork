%% Devon Quaternik
% ELEN 431
% HW 6

%% Problem 1

% Part 1
clear all;
global U P K X H T init lambda delta alpha; 
plots = 4;
B = [2.9 3.1 3.3 3.5];


CHANNEL_MODE = 0;       

if CHANNEL_MODE > 0
    plots = 1;
end

for l=1:plots

    runs = 20; 
    iterations = 500;
    N = 11;
    delay = 7;
    nchannel = 3;
    var1 = 0.001;

    sqerr = zeros(runs, iterations);
    for m=1:runs

        a = sign( 2.0 * (rand(iterations,1) - ones(iterations,1)*0.5));

        v = sqrt(var1) * randn(iterations,1);

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

        u = conv(h,a);

        v = [v' zeros(1,nchannel-1)]';
        x = u + v;

        b = [zeros(1,delay) 1];
        d = filter(b,1,a);

        init = 1;
        T = -1;

        W = zeros(N,1);
        e = zeros(iterations, 1);

        for j = 1:iterations
              [T,error,W,init] = rls(T,N,d(j),x(j),init);

              e(j) = error;
              sqerr(m,j) = e(j) * e(j);
        end
        PSIfinal(m) = sqerr(m,iterations);
        WW(1:N,m) = W;
    end 
    WWW(1:N,l)=mean(WW')';
    PSI(l,:) = mean(sqerr);
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
titles = 'Channel Equalization (RLS)  Ensemble-ave Squared Error';
tt = 'Channel Equalization (RLS)  Time-ave Squared Error';
xaxis=(1:iterations);
figure;

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
xlabel(xl),ylabel(yl); 

% Part 2, equalizing H2 to H1

clear all; 
plots = 4;

CHANNEL_MODE = 2;       
if CHANNEL_MODE > 0
    plots = 1;
end

for l=1:plots

    runs = 20; 
    iterations = 500;
    N = 11;
    delay = 7;
    nchannel = 3;
    var1 = 0.001;

    sqerr = zeros(runs, iterations);
    for m=1:runs

        a = sign( 2.0 * (rand(iterations,1) - ones(iterations,1)*0.5));

        v = sqrt(var1) * randn(iterations,1);


        h1 = [0.35 1 -0.35];
        h2 = [0.35 1 0.35];

        u = conv(h1,a);

        v = [v' zeros(1,nchannel-1)]';
        x = u + v;

        b = [zeros(1,delay) 1];
        d = conv(h2,a);

        init = 1;
        T = -1;

        W = zeros(N,1);
        e = zeros(iterations, 1);

        for j = 1:iterations
              [T,error,W,init] = rls(T,N,d(j),x(j),init);

              e(j) = error;
              sqerr(m,j) = e(j) * e(j);
        end
        PSIfinal(m) = sqerr(m,iterations);
        WW(1:N,m) = W;
    end 
    WWW(1:N,l)=mean(WW')';
    PSI1(l,:) = mean(sqerr);

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
titles = 'Channel Equalization (RLS) MSE H2 to H1';
tt = 'Channel Equalization (RLS)  Time-ave Squared Error';
xaxis1=(1:iterations);
figure;
semilogy(xaxis1,PSI1(1,:),'r-');
hold on;
xlabel(xl),ylabel(yl);
title('Channel Equalization (RLS) MSE H1 to H2');

disp('The first graph shows the effects of different eigenvalue spread and how the RLS converges. When using it to equalize the given H1 and H2, the misadjustmetn is high, at around 10^-2, but convergence happens in less than 50 iterations.');


%% Problem 2 


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

        a = sign( 2.0 * (rand(iterations,1) - ones(iterations,1)*0.5));
        v = sqrt(var) * randn(iterations,1);

        for n=1:nchannel
            ht(n) = 0.5 * (1.0 + cos(2*pi*(n-2)/B(l)));
        end
        h=[ht(1)  ht(2)  ht(3)];

        u = conv(h,a);

        v = [v; zeros(nchannel-1,1)];
        x = u + v;

        b = [zeros(1,delay) 1];
        d = filter(b,1,a);

        W = zeros(N,1);
        e = zeros(iterations, 1);
        y = zeros(iterations, 1);

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
titles = 'Channel Equalization (LMS)  Ensemble-ave Squared Error';
xaxis=(1:length(PSI));
figure;
semilogy(xaxis,PSI(1,:),xaxis,PSI(2,:),xaxis,PSI(3,:),xaxis,PSI(4,:)),
title(titles),ylabel('dB '),xlabel(xl),
legend('W=2.9','W=3.1','W=3.3','W=3.5');


% Part 2
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

        a = sign( 2.0 * (rand(iterations,1) - ones(iterations,1)*0.5));
        v = sqrt(var1) * randn(iterations,1);

        for n=1:nchannel
            ht(n) = 0.5 * (1.0 + cos(2*pi*(n-2)/B(l)));
        end
        h=[ht(1)  ht(2)  ht(3)];

        h1 = [0.35 1 -0.35];
        h2 = [0.35 1 0.35];

        u = conv(h1,a);

        v = [v; zeros(nchannel-1,1)];
        x = u + v;

        b = [zeros(1,delay) 1];
        d = conv(h2,a);

        W = zeros(N,1);
        e = zeros(iterations, 1);
        y = zeros(iterations, 1);

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
titles = 'MSE equalizing H1 to H2';
xaxis=(1:length(PSI));
figure;
hold on;
semilogy(xaxis,PSI(1,:),'r-',xaxis1,PSI1(1,:)),
title(titles),ylabel('dB '),xlabel(xl)
legend('RLS','LMS');


disp('As you can see in Figure 2, the RLS converges much quicker and to a lower value than the LMS overall. But this comes at the cost of performance. Although you cannot see it, the time to run the RLS was much longer than LMS.');

