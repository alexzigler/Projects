function x_kplus1 = cmsd_nonlinear_discrete(Ts,xk,uk)

k1=2/5; % N/m
k2=1;
m1=1; % kg
m2=2;
delta1=1/10; %
delta2=1/5;
miu1=1/6; %
miu2=1/10;

x1=xk(1);
x2=xk(2);
x3=xk(3);
x4=xk(4);

x_kplus1=xk+Ts*[x3;
                x4;
                -delta1/m1*x3-k1/m1*x1+miu1/m1*x1^3-k2/m1*(x1-x2)+miu2/m1*(x1-x2)^3+uk(1)/m1;
                -delta2/m2*x4-k2/m2*(x2-x1)+miu2/m2*(x2-x1)^3+uk(2)/m2];

end