function  [T,ret,W,init] =rls(T,N,d,y,init)
global U P K X H T init lambda delta alpha; 
% echo on
%
%
% Recursive Least-Squares  Matlab version - Tokunbo Ogunfunmi 
% *******************************************************
%
% This subroutine implements the Recursive-Least-Squares
% (or Kalman) Algorithm with no algebraic simplification. 
% The parameter init determines the call as an initial call 
% or an update call. The updated FIR tap values are returned 
% in the N-dimensional array H. The error is also returned. 
% y is the current input value and d is the desired response.
%
% *********************************************************
if (nargin > 5)
	disp(' Error : number of input arguments to rls.m ');
end 

% **********************************************************

% Initialization call

	if (init == 1)
		if (abs(y) < 1.0e-10) 
			return; %break;
		end
		T=-1;
		init=0;
                H=zeros(N,1);  % initialize the weights
		U=zeros(N,1);  % initialize the data vector
%		U(N)=y;		
		lambda   = 1.0;
%		lambda   = input(' lambda  = ');
		delta   = 0.004; %1.0e-6;
%		delta   = input(' delta  = ');
		delta=1.0/delta;

                P = zeros(N,N);
		for i=1:N
	                P(i,i)=(lambda^(N-i))*delta;
		end

		K = zeros(N,1);

	end

% *****************************************
%	Now run one iteration
% *****************************************
% Update calls
	if(init == 0)
		T = T + 1;
%		init = init;
		U = [U(2:N);  y];
%		U = [y;  U(2:N)];
		X = (1/lambda) * P * U;
		K = (1/(1 + U' * X)) * X;
		alpha = d - H' * U;
		H = H + K * conj(alpha);
		P = (1/lambda)*P - K * X';
                ret = alpha;
%		W(1:N,1) = H(1:N,1);
		W(1:N,1) = H(N:-1:1,1);
	end

% ***********************************************

