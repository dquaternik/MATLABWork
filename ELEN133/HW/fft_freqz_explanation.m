%% This example is intended to clarify FFT or a freqz outputs.

% Quick side note - the "axis" commands are intended to line things up so
% you can visually distinguish when something is "as it was" or has been
% "fftshifted"  It is considered above expectation to fully grasp what the
% axis commands are doing.

% First, let's set some variables.
sampling_freq = 10;
cosine_freq = 1000;
N=128;
% We will have N points, that range from 0 to N-1.

% This means that we will have N samples of a cosine of that started with 
% the form cos(2*pi*(cosine_freq)*t) - but, after being sampled, we will 
% have:
% cos(2*pi*(cosine_freq)*nT) = cos(2*pi*(cosine_freq)*n*(1/Sampling_freq))

% Let's set up the cosine.

n=0:N-1;
x=cos(2*pi*cosine_freq*n/sampling_freq);

% 
% This plot command plots vs. the MATLAB internal indices - which is 1 to
% N.  Note: these have no relationship with the real world...  This just
% represents how MATLAB intends for you to access these values.

figure(1)
subplot(2,1,1);
stem(x);
xlabel('MATLAB indices');
title('Sampled Signal');

% 
% This plot command plots vs. n.  While above went from 1:N, this should go
% from 0:N-1.
subplot(2,1,2);
stem(n,x);
xlabel('n');


%% FFT
% Now we look at the FFT

% Here, X_mag takes on the value of the magnitude of the FFT of x.  
% MATLAB will create N points and, like x, will assign them to internal
% indices that go from 1 to N.  And, again, like x, and based on the
% definition of the DFT, these will map to values that we would call
% n=0:N-1.
X_mag = abs(fft(x));

% What is hard to see here is the periodicity that would result if we were
% to continue.  But, what we see is exactly one period.  The n=N point
% (MATLAB index N+1) would be identical to n=0 (MATLAB index 1).  

% This first plot simply plots the X_mag vs. the MATLAB indices - i.e. 1:N.
figure(2)
subplot(5,1,1);
stem(X_mag);
axis([0 N min(X_mag) max(X_mag*1.1)]);
xlabel('MATLAB indices');
title('Magnitude of FFT');

% Again, by putting the "n," in front, the following will plot this vs. n
% as is defined by the DFT equation.  So, n=0 corresponds to the DFT sample
% that is the sum of all x[n], etc. 
subplot(5,1,2);
stem(n, X_mag);
axis([0 N min(X_mag) max(X_mag*1.1)]);
xlabel('n');


% Now, the next step would be to determine what frequencies these
% correspond to.  We know that 2pi corresponds to N - so, if we were to
% plot this - n=0 maps to w=0.  And, n=N-1 maps to (N-1)*2*pi/N.  Let's
% create that variable here:
w=n*2*pi/N;

% Plotting this reveals how the values line up relative to w
subplot(5,1,3);
stem(w,X_mag);
axis([-(2*pi)/N max(w)+(2*pi)/N min(X_mag) max(X_mag*1.1)]);
xlabel('w');

% To this point, we've done NOTHING to X_mag - we've simply changed what we
% are calling the points on the x-axis - that is, the things that align
% with the samples of the DFT.  

% Now say we'd prefer to look at w from -pi to pi... well, we can't do
% that.  Namely because the value at -pi and the value at pi would be the
% same (periodic) and MATLAB doesn't go beyond the one period.  
% Doing the math on the the w that we do have would make this point as
% well.
% From above, we have 0, 1*2pi/N, 2*2pi/N, ... (N-1)*2pi/N.
% Now, if we want to look at this as a two-sided spectra with 0 in the
% 'middle' we would want to take the points that line up with the range 
% (pi through (N-1)*2pi/N) and bring them to the left.  This is the right
% half of the points that were calculated. 
% In terms of MATLAB indices, this corresponds to (N/2)+1 through N
% In terms of n, this corresponds to N/2 through N-1.
% And, in terms of w, this corresponds to (N/2)*2pi/N through (N-1)*2pi/N
% or, condensing the math above - for w - from pi through (N-1)*2pi/N as
% previously described.
% The fftshift command takes the right half of X_mag and puts it on the
% left, but it does nothing to the labels.
% We could fftshift the labels and they'd align... however, this wouldn't
% take into account the periodicity.  Meaning, moving the "right half" of
% the labels to the left would leave us with labels that look like this:
% pi, ((N/2)+1)*2pi/N, ((N/2)+2)*2pi/N, ... (N-1)*2pi/N, 0, 2pi/N, ...
% ((N/2)-1)*2pi/N

% We'd prefer the left half of these labels to be offset by 2pi to have
% continuity to our labels.  If we take the left half and subtract 2pi,
% everything looks correct.  This is IDENTICAL to simply taking w and
% subtracting pi to scoot the labels to the left by pi.
subplot(5,1,4);
stem(w-pi, fftshift(X_mag));
axis([min(w-pi)-(2*pi)/N max(w-pi)+(2*pi)/N min(X_mag) max(X_mag*1.1)]);
xlabel('w');

% Finally, we likely want to know what frequencies this corresponds to.
% We know that w=2*pi corresponds with the sampling frequency.  
% We can use this relationship to finish our task.
% f should equal (w/(2*pi))*sampling_freq
subplot(5,1,5);
stem((w-pi)*sampling_freq/(2*pi),fftshift(X_mag));
axis([min((w-pi)*sampling_freq/(2*pi))-(sampling_freq/2/pi/N) max((w-pi)*sampling_freq/(2*pi))+sampling_freq/2/pi/N min(X_mag) max(X_mag*1.1)]);
xlabel('f');

% In this case, we've taken the axis that was -pi to ((N/2)-1)*2pi/N and
% multiplied it by (sampling_freq/2pi).  This took the above range and
% translated the left most label, that was -pi, and turned it into
% -sampling_freq/2.  And, the right most label, that was ((N/2)-1)*2pi/N
% and translated it to ((N/2)-1)*2pi/N * sampling_freq/2pi... that leaves
% us with sampling_freq*((N/2)-1)/N or 
% sampling_freq/2 - sampling_freq*(1/N)

%% FreqZ
% Now, let's look at what freqz does

[H1 w1]=freqz(x,1,N,'whole');

% This command will result in H1 taking on the DTFT, or DFT, or frequency
% response for points 1:1024.  And, w1 will be assigned to the frequencies
% that it was calculated for.

% If we simply plot abs(H1) vs. w1 - we should end up with a plot IDENTICAL
% to the plot in row 3 of figure(2).
figure(3)
subplot(2,1,1);
stem(w1,abs(H1));
xlabel('w');
axis([-(2*pi)/N max(w1)+(2*pi)/N min(abs(H1)) max(abs(H1)*1.1)]);
title('freqz (whole) output');

% In fact, one way to show that the values are the same is to subtract one
% from the other and sum... let's do that for w1 vs. w and abs(H1) vs. 
% X_mag.  Note that to make the dimensions identical, I had to take the
% transpose of the arrays returned by freqz... one put the values in a
% single row, the other put the values in a single column.
sum(w-w1')

sum(X_mag-abs(H1'))

% We can also plot the above vs. f in the same way we did in the previous
% example - but, we'd have to shift the axis by pi, do the fftshift and
% scale appropriately.  This should result in the same plot as in the 5th
% plot in figure(2).
subplot(2,1,2);
stem((w1-pi)*sampling_freq/(2*pi),fftshift(abs(H1)));
axis([min((w1-pi)*sampling_freq/(2*pi))-(sampling_freq/2/pi/N) max((w1-pi)*sampling_freq/(2*pi))+sampling_freq/2/pi/N min(abs(H1)) max(abs(H1)*1.1)]);
xlabel('f');

% Finally, let's look at what freqz does with only the right hand side...
[H2 w2]=freqz(x,1,N);

figure(4)
subplot(2,1,1);
stem(w2,abs(H2));
axis([-(2*pi)/N max(w2)+(2*pi)/N min(abs(H2)) max(abs(H2)*1.1)]);
xlabel('w');
title('freqz (one-sided) output');

% And, again, we can map these to frequencies (in Hertz).

subplot(2,1,2);
stem(w2*sampling_freq/(2*pi), abs(H2));
axis([min(w2*sampling_freq/2/pi)-sampling_freq/2/pi/N max(w2*sampling_freq/2/pi)+(sampling_freq/2/pi/N) min(abs(H2)) max(abs(H2)*1.1)]);
xlabel('f');

