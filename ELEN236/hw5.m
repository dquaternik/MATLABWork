%% CME 6.4
a=[0 1 0 0; 0 0 1 0; 0 0 0 1; -680 -176 -86 -6];
b=[0;0;0;1];
c=[ 100 20 10 0];
d=0;

sys=ss(a,b,c,d);

m=[1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1]; 


S=lyap(a,m);
E=eig(S);

if E>0
    disp('Lyapunov stable')
else
    disp('not Lyapunov stable')
end

E1=eig(a);

if E1<0
    disp('Eig stable')
else 
    disp('Not Eig stable')
end