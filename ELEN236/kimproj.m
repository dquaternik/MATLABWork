%% March 8th 2016 Project 1.5
% Problem 7.4 a/b
% part a)

% desired eigne values: 
Wn = 2.56508;
z = 0.779703;
num = [Wn^2];
den = [1 2*z*Wn Wn^2];
I = eye(4);
% made the second and third eigen values -20 and -21 for the following
% desired eigen values:
%  -2.0000 + 1.6061i
%  -2.0000 - 1.6061i
%  -20.000 + 0.0000i 
%  -21.000 + 0.0000i
% desired characteristic polonomial: 

% s^4 + 45s^3 + 590s^2 + 1949s +2763

figure(1)
subplot(2,1,1)
%  Original system
step(sys1)
title('Step Response for the Open Loop System')
axis([0 4 -2 2]);

% finding a value of K 
Pinv = inv(Pccf); % Pccf comes from an early section of the problem
Desired = ((Accf^4)+ 45*(Accf^3)+ 590*(Accf^2) + 1949*(Accf) + 2763*I);
K = [0 0 0 1]*(Pinv)*Desired ;

% finding the new matrix A 
BK = Bccf*K;
Anew = Accf-BK;
%Should be the desired eigen values written above
eig(Anew)
[num3, den3] = ss2tf(Anew,Bccf,Cccf,Dccf);
sys3 = tf(num3, den3);

subplot(2,1,2)
step(sys3)
title('Step Reponse for the Closed Loop System')
axis([0 4 -0.5 0.5]);
stepinfo(sys3)

figure(2)
subplot(2,1,1)
impulse(sys1)
title('Impulse Response of the First System')
axis([0 4 -2 2]);

subplot(2,1,2)
impulse(sys3)
title('Impulse Response of the System After Closed Loop Feedback')
axis([0 4 -0.5 0.5]);

% Both the criteria we set for out system,  Settling time of 2s and a
% Overshoot of 2% were met. Our system stableized at a negative value,
% meaning the physical system would find a stable position leaning to the
% right or left, depending on how the positive direction was defined. 