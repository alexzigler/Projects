function mse = val_closed(model,data)
P=4.9395;
I=0.0023;
D=5.188;
N=100;

% Hr=tf([D*N+P,I+P*N,I*N],[1 N 0]);
Hr=tf([D,P,I],[1 0]);
Hd=series(model,Hr);
Ho=feedback(Hd,1);

[ysim,~,~]=lsim(Ho,data.u,timeyy(data));
mse=sqr_error(ysim,data.y);

end

