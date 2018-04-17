DR=pi/180;
L1=4; L2=3; L3=2;

alp(1)=0; a(1)=0; d(1)=0; th(1)=0;
alp(2)=0; a(2)=L1; d(2)=0; th(2)=0;
alp(3)=0; a(3)=L2; d(3)=0; th(3)=0;

L{1}=link([typecast(alp(1),'single'),typecast(a(1),'single'),typecast(th(1),'single'),typecast(d(1),'single'),typecast(0,'single')],'mod');
L{2}=link([alp(2),a(2),th(2),d(2),0],'mod');
L{3}=link([alp(3),a(3),th(3),d(3),0],'mod');

ThreeR = robot(L, 'Plan3R');

q1 = [0 0 0]*DR;
q2 = [10 20 30]*DR;
q3 = [90 90 90]*DR;

T30_1 = fkine(ThreeR,q1);
T30_2 = fkine(ThreeR,q2);
T30_3 = fkine(ThreeR,q2);

TH3=[1 0 0 L3; 0 1 0 0; 0 0 1 0; 0 0 0 1];

TH0_1 = T30_1*TH3;
TH0_2 = T30_2*TH3;
TH0_3 = T30_3*TH3;