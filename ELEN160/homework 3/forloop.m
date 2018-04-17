t=1;
for p = -1000:1000
    A = [0 1; (p^2 + 2*p + 3) -p]; 
    E(:,t) = eig(A);
    t=t+1;
end
plot(p, E(:,1), p, E(:,2))