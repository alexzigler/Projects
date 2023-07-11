%% initials
clear
A=332.5;
k=0.035;
k1=0.624;
k2=-0.015;
k3=-0.0006;
keta=8e-5;
% k11=k2^2+4*(k-k3)*k1;
% k12=8*(k-k3);
% k13=2*(k-k3);


%% vanilla
C=9;
ua=5;

%% mydata
C=8;
ua=4.2;

%% calcs
%sim area 1

hinitial=mean(out.h(end-10:end));
qinitial =mean(out.qi(end-10:end));

%sim area 2

%%
hfinal=mean(out.h1(end-10:end));
[kp,Tp]= identify1(out.h1,ua+0.5,ua,out.tout);
kp=kp/3;

T0=Tp/4;

Hp=tf(kp,[Tp 1]);
H0=tf(1,[T0,1]);
Hr=1/Hp*H0/(1-H0);
Hr=pidstd(Hr);
% sim area 3

%% feedforward
dh=hfinal-hinitial;
dqi= max(out.qi1)- qinitial;
k_comp=(ua+0.5-ua)/dqi;

%% cascade

%id1
tlast=find(out.tout>10,1);
[kp1,Tp1]=identify1(out.qi1(1:tlast),ua+0.5,ua,out.tout(1:tlast));

% T01=0.25;
T01=1;
Hp1=tf(kp1,[Tp1 1]);
H01=tf(1,[T01,1]);
Hr1=1/Hp1*H01/(1-H01);
Hr1=pidstd(Hr1);
%sim area 5

%%
%id 2
[kp2,Tp2]=identify1(out.h3,qinitial+dqi,qinitial,out.tout);
kp2=kp2/3;
Hp2=tf(kp2,[Tp2,1]);

T02=Tp/4;
H02=tf(1,[T02,1]);
Hr2=1/Hp2*H02/(1-H02);
Hr2=pidstd(Hr2);

%% id
function [k,T] = identify1(output,uss,u0,time)

yss=mean(output(end-10:end));
y0=output(1);

k=(yss-y0)/(uss-u0);
y=y0+0.63*(yss-y0);

error=100;

for t=1:length(time)
    if abs(output(t)-y) < error
        error = abs(output(t)-y);
        T=time(t);
    end
end

end

