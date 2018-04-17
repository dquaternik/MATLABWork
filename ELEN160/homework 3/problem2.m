clear;
clc;
clf;

hold on;
set(gcf,'Renderer','painters');
for p=0:.01:2
    equilib=equil2(p);
    
    jaceqn1=jack2(equilib(1),equilib(2),p);
    [d1,v1]=eig(jaceqn1);
    
    jaceqn2=jack2(0,0,p);
    [d2,v2]=eig(jaceqn2);
    
    plot(p,equilib(1),'o','color','r');
    plot(p,equilib(2),'o','color','b');
    plot(p,v1(1,1),'o','color','g');
    plot(p,v1(2,2),'o','color','y');
    plot(p,v2(1,1),'o','color','c');
    plot(p,v2(2,2),'o','color','k');
    
end
legend('x1 equilibrium','x2 equilibrium','first eig, first eqn','second eig, first eqn','first eig, second eqn','second eig, second eqn');