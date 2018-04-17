%% Creating a sequence and sample operations
% This example is intended to show how to set up a sequence and perform
% sample operations on the sequences created.

%% Setting up a basic sequence
% This shows you how to set up a basic array

A = [1 2 3 4 5];  % This creates an array with the samples 1, 2, 3, 4 and 5.

% To see the output in MATLAB, remove the semi-colon at the end of a
% statement or simply type the variable at the prompt or within the script.
A

% This format creates an array that starts with 1, with a step size of 1
% and ends with 5.  Thus, it also creates an array with the samples 1, 2, 3, 4 and 5.
B = 1:1:5

% Similar to the previous example, this creates an array that starts at 2,
% steps with a size of 2 and ends at 10.
C = 2:2:10       % This creates an array with the elements 2, 4, 6, 8 and 10.

%% Operations
% Now we can perform some operations on the above sequences.

% Operation 1: Product or Modulation
% Modulation is a point-by-point multiplication of two sequences.  So, the
% first element of each are multiplied by each other, followed by the next
% two samples, and so on.  The "*" operator in MATLAB performs array
% multiplication.  To do modulation - or point-by-point multiplication -
% you must put a "." in front of it.  It looks like this:
output1 = A.*B

% Operation 2: Multiplication by a scalar
output2 = 4*A
output3 = 4.*A

% When multiplying by a scalar, it doesn't matter if you put the "." there
% or not.

% Operation 3: Addition of two sequences
output4 = A+C
%% Accessing elements or samples
% MATLAB starts counting at index number 1.  So, to view the 3rd element of
% an array, we would simply type A(3)

A(3)

% This result should be a 3, since the sequence was 1,2,3,4,5.

C(4)

% This result should be an 8, since the sequence was 2,4,6,8,10.

%% Plotting
% There are a number of ways to plot

% stem will create lollipop like stems at discrete values
figure()
stem(A)

% plot will connect the dots and make as smooth a connection as possible
% between points.
figure()
plot(A)

% Say I had indices defined for n from -4 to 4 and defined a sequence as
% 2*abs(n).
n=-4:4  %If no step size is defined, 1 is assumed.
X=2*abs(n)

% Just typing plot(X) will result in a signal with values from 1 to 9.
figure()
plot(X)

% To see the sequence vs. the appropriate indices, one has to type
% plot(n,X).
figure()
plot(n,X)

% Finally, if I want to see a stem plot, I can use that command
figure()
stem(n,X)

% Here, the end points make it hard to visualize the stems, so, I can run
% the axis command to set the points.
help axis

axis([-5 5 0 9])
