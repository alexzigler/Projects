%LuGre model parameters
m=1;
k=2;
alpha=1;
sigma0=2900;%3.9e4;
sigma1=107;%395;
sigma2=0;
Fc=2.94;
Fs=5.88;
vs=0.1;%0.01;

g=@(v)(Fc+(Fs-Fc)*exp((-abs(v/vs)).^alpha));
f=@(v)sigma2*v;
Fss=@(v)g(v).*sign(v)+f(v);

t=-5:0.001:5;
plot(t,Fss(t))
xlabel('t')
title('F_{ss}')


%%
Ac=[0 1; 0 0];
Bc=[0;1];
Kstfb=[place(Ac,Bc,[-35,-30]),0]