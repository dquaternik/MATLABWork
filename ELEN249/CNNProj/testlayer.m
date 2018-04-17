% Script to call the functions (only doing layer 1, so all parameters are
% hardcoded)
clear;
%Layer 1
N = 3;
M = 48;
R = 55;
C = 55;
K = 11;
S = 4;

output_fm1 = zeros(M,R,C,'single');
output_fm2 = zeros(M,R,C,'single');
output_fm3 = zeros(M,R,C,'single');
input_fm  = imread('4.1.07.tiff');
input_fm = imresize(input_fm,[244 244]);
weights = (-1) + (1-(-1)).*rand(M,N,K,K,'single');
ex = cast(input_fm,'like',weights);

% Turn code1, 2, 3 into functions

output_fm1 = code1(ex,weights);
disp('Code 1 complete');
output_fm2 = code2(ex,weights);
disp('Code 2 complete');
output_fm3 = code3(ex,weights);
disp('Code 3 complete');
