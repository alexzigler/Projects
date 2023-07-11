function x_kplus1 = cmsd_linear_discrete(Ts,xk,uk)

    k1=2/5; % N/m
    k2=1;
    m1=1; % kg
    m2=2;
    delta1=1/10; %
    delta2=1/5;

    A=[0 0 1 0;
       0 0 0 1;
       -k1/m1-k2/m1 , k2/m1 , -delta1/m1 , 0;
        k2/m2, -k2/m2 , 0 , -delta2/m2];

    B=[0,0;
       0,0;
       1/m1,0;
       0,1/m2];

    Ad=eye(4)+Ts*A;
    Bd=Ts*B;

    x_kplus1=Ad*xk+Bd*uk;
end