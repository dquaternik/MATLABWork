%HW 2 problem 1
N = 500000;

n_k = sqrt(0.5)*randn(1,N);
ex=conj(n_k);
%variance stays same for both cases
var = mean(n_k.*ex)

%AR process 1
a = [1 0.8987 0.9018]; b = [1];
x_k = filter(b, a, n_k);
plot(x_k)
ar1_rxx_1 = mean(x_k(2:end).*x_k(1:(end-1)))
ar1_rxx_2 = mean(x_k(3:end).*x_k(1:(end-2)))

%AR process 2
a = [1 -0.057 -0.889]; b= [1];
x_k = filter(b, a, n_k);

ar2_rxx_1 = mean(x_k(2:end).*x_k(1:(end-1)))
ar2_rxx_2 = mean(x_k(3:end).*x_k(1:(end-2)))