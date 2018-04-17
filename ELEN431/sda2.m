% Illustrate SDA with data from prob 2 in HW 1

% From prob 2 in HW 1
X = [1 5 2; 6 3 1]';
d = [5 4 1]';
a1 = -0.1950;  % from table 4.1 on page 215
%a1 = -0.9750;  % from table 4.1 on page 215
%a1 = -1.5955;  % from table 4.1 on page 215
%a1 = -1.9114;  % from table 4.1 on page 215
a2=0.95;          % from table 4.1 on page 215
r1 = -a1/(1+a2);
r2 = -(1 + a1*r1)/a2;
Rx = [1, r1; r1, 1];
Rxd = [r1; r2];
Rdd = 1;

% Compute error surface in [-2,2]x[-2,2]
w0 = -2:0.1:3;
Nw0 = length(w0);
err = zeros(Nw0, Nw0);
for x=1:Nw0,
    for y=1:Nw0,
        w = [w0(x),w0(y)];
        err(y,x) = w*Rx*w' - 2*Rxd'*w' + Rdd; % row for y, col for x
    end
end
contour(w0,w0,err, 28*2); grid on; % contour(x(i),y(j), err(y(j),x(i))),

% Draw the convergence path 
N = 1000;
w = zeros(2,N);
mu = 0.3;         % 1/Lmax = 0.016 for this example
w(:,1) = [0 0]';
for i=2:N,
    w(:,i) = w(:,i-1) + mu*(Rxd - Rx*w(:,i-1));
end
hold on;
plot(w(1,:), w(2,:)); % Note the convention of contour cmd above
%plot(w(1,:), w(2,:),'.'); % use this to see speed of convergence    
hold off
