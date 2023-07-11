A=8;
Rs=2.66;
U21=16;
ku1=0.7468;
kr=0.2;
u0=0.5;
V0_ref=u0*0.2*U21;
C=9.5812e-5;
L=5.0498e-5;
%functia de transfer a partii fixe
Hf=tf(1/(2*A)*sqrt(2)*ku1*U21,[L*C L/Rs 1]);
figure
bode(Hf)


%% pi
w=1.53e+4;% frecventa la faza=-115
kdb=-10.4;
k=db2mag(kdb);
Ti=4/1.53e+4;
Hr=tf(k*[Ti,1],[Ti 0]);
Hd=series(Hf,Hr);
Ho=feedback(Hd,0.2);
figure
bode(Ho)
[num_pi,den_pi]=tfdata(Hr,'v');
%% pd
beta=0.1;
gamastar=rad2deg(atan(0.9/2*sqrt(0.1)));
w=4.64e5;
Td=1/w/sqrt(beta);
kdb=59.8;
k=db2mag(kdb)*sqrt(beta);
Hr=tf(k*[Td,1],[Td*beta,1]);
Hd=series(Hf,Hr);
Ho=feedback(Hd,0.2);
step(Ho)
[num_pd,den_pd]=tfdata(Hr,'v');
%% p

k=1/(10^(-8.41/20));