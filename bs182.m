aes=2.93;
ic=1250;
pr=46.88;
om=0;
r=0.03;
i=.12;
d=i-r;
n=30;

upwf=[(1+d)^n-1]/(d*(1+d)^n)
pvs=(aes*pr-om)*upwf
npv=pvs-ic