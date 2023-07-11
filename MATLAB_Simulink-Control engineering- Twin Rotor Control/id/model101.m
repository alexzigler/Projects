string="C:\Users\Alex\Documents\matlab ira2\project\all_iddata\";
load(strcat(string,"z_dataset.mat"));
s=load(strcat(string,"z_dataset.mat"));

fn = fieldnames(s);
for k=1:numel(fn)
        array{k}=s.(fn{k});
end

%  [mse,mdl]=bestfriend2(array(4:6),20); 
%obs: setul 3 de date are conditii initiale indepartate de zero

% model=d2c(tf(mdl),'tustin');

%%
dataname=array{6};
[y,t,~]=lsim(H,dataname.u,timeyy(dataname));
figure
plot(t,y(:,1),t,dataname.y(:,1))
legend("y_{aprox}","y_{real}")
title("azimuth")
figure
plot(t,y(:,2),t,dataname.y(:,2))
title("pitch")
legend("y_{aprox}","y_{real}")
%%
load("model_azimuth_bun")
tf11=model;%%CLOSED LOOP

azi_input21=iddata(z_dataset_1dof_azi_02.y(:,2),z_dataset_1dof_azi_02.u(:,1),0.01);

pitch_12=iddata(z_dataset_1dof_pitch_02.y(:,1),z_dataset_1dof_pitch_02.u(:,2),0.01);

pitch_22=iddata(z_dataset_1dof_pitch_02.y(:,2),z_dataset_1dof_pitch_02.u(:,2),0.01);

[num11,den11]=tfdata(tf11,'v');
[num12,den12]=tfdata(tf12,'v');
[num21,den21]=tfdata(tf21,'v');
[num22,den22]=tfdata(tf22,'v');
nums={num11,num12;num21,num22};
dens={den11,den12;den21,den22};
H=tf(nums,dens);