%% Devon Quaternik
%ELEN337
%HW 3 Problem 3

%DH Parameters
DR=180/pi;
syms the1 the2 the3
l1=4;
l2=3;
l3=2;
al = [0 0 0]';
a = [0 l1 l2]';
d = [0 0 0]';
theta = [the1 the2 the3]';

t01=[cos(the1) -sin(the1) 0 0; sin(the1) cos(the1) 0 0; 0 0 1 0; 0 0 0 1];
t12=[cos(the2) -sin(the2) 0 l1; sin(the2) cos(the2) 0 0; 0 0 1 0; 0 0 0 1];
t23=[cos(the3) -sin(the3) 0 l2; sin(the3) cos(the3) 0 0; 0 0 1 0; 0 0 0 1];
t3h=[1 0 0 l3; 0 1 0 0; 0 0 1 0; 0 0 0 1];

t03=t01*t12*t23
t0h=t03*t3h

%part i
thet1=0;
thet2=0;
thet3=0;
t01=[cos(thet1) -sin(thet1) 0 0; sin(thet1) cos(thet1) 0 0; 0 0 1 0; 0 0 0 1];
t12=[cos(thet2) -sin(thet2) 0 l1; sin(thet2) cos(thet2) 0 0; 0 0 1 0; 0 0 0 1];
t23=[cos(thet3) -sin(thet3) 0 l2; sin(thet3) cos(thet3) 0 0; 0 0 1 0; 0 0 0 1];
t3h=[1 0 0 l3; 0 1 0 0; 0 0 1 0; 0 0 0 1];

t03=t01*t12*t23
t0h=t03*t3h


%part ii
thet1=10*DR;
thet2=20*DR;
thet3=30*DR;
t01=[cos(thet1) -sin(thet1) 0 0; sin(thet1) cos(thet1) 0 0; 0 0 1 0; 0 0 0 1];
t12=[cos(thet2) -sin(thet2) 0 l1; sin(thet2) cos(thet2) 0 0; 0 0 1 0; 0 0 0 1];
t23=[cos(thet3) -sin(thet3) 0 l2; sin(thet3) cos(thet3) 0 0; 0 0 1 0; 0 0 0 1];
t3h=[1 0 0 l3; 0 1 0 0; 0 0 1 0; 0 0 0 1];

t03=t01*t12*t23
t0h=t03*t3h

%part iii
thet1=90*DR;
thet2=90*DR;
thet3=90*DR;
t01=[cos(thet1) -sin(thet1) 0 0; sin(thet1) cos(thet1) 0 0; 0 0 1 0; 0 0 0 1];
t12=[cos(thet2) -sin(thet2) 0 l1; sin(thet2) cos(thet2) 0 0; 0 0 1 0; 0 0 0 1];
t23=[cos(thet3) -sin(thet3) 0 l2; sin(thet3) cos(thet3) 0 0; 0 0 1 0; 0 0 0 1];
t3h=[1 0 0 l3; 0 1 0 0; 0 0 1 0; 0 0 0 1];

t03=t01*t12*t23
t0h=t03*t3h


%% Check with the robotics toolbox
%initialize links with 0 params for thetas
link1 = link([0, d(1), a(1),al(1),0,0],'mod')
link2 = link([0, d(2), a(2),al(2),0,0],'mod')
link3 = link([0, d(3), a(3),al(3),0,0],'mod')

%create robot
rrr=robot({link1, link2, link3});

%create poses
pose1=[0 0 0]*DR
pose2=[10 20 30]*DR;
pose3=[90 90 90]*DR;

%find transformation matrices for given pose
t031 = fkine(rrr,pose1);
t032 = fkine(rrr,pose2);
t033 = fkine(rrr,pose3);

%Th0 matrices
t0h1 = t031*th3
t0h2 = t032*th3
t0h3 = t033*th3

%link function does not seem to accept any data type I can figure out. Constantly gives errors even when typecasting. I am not able to find good documentation on this function and cannot seem to get it to work
