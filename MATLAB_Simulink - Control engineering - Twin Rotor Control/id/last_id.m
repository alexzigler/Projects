load("035PitchOpenLoop")
t=SD1.time;
azi=SD1.signals(1).values;
pitch=SD1.signals(2).values;
% plot(t,pitch)

azi=azi-azi(1);

z_pitch_step035_pitch_out=iddata(pitch,0.35*ones(length(t),1),t(2));
z_pitch_step035_azi_out=iddata(azi,0.35*ones(length(t),1),t(2));
%%
load("02PitchOpenLoop")
t=SD1.time;
azi=SD1.signals(1).values;
pitch=SD1.signals(2).values;
% plot(t,pitch)

azi=azi-azi(1);

z_pitch_step02_pitch_out=iddata(pitch,0.2*ones(length(t),1),t(2));
z_pitch_step02_azi_out=iddata(azi,0.2*ones(length(t),1),t(2));


%% h22 id
% load("02AzimuthOpenLoop")
% t=SD1.time;
% azi=SD1.signals(1).values;
% pitch=SD1.signals(2).values;
% plot(t,azi,'r')
data=z_pitch_step035_pitch_out;

h22=tfest(data,3);
% h22=
figure
plot(timeyy(data),data.y,'r')
hold on;
lsim(h22,data.u,timeyy(data))
legend("y_{real}","y_{aprx}")

data=z_pitch_step02_pitch_out;
figure
plot(timeyy(data),data.y,'r')
hold on;
lsim(h22,data.u,timeyy(data))
legend("y_{real}","y_{aprx}")
%% h12 id pitch input azimuth output

data=z_pitch_step035_azi_out;
h12=tfest(data,2);

figure
plot(timeyy(data),data.y,'r')
hold on;
lsim(h12,data.u,timeyy(data))
legend("y_{real}","y_{aprx}")

%

data=z_pitch_step02_azi_out;
figure
plot(timeyy(data),data.y,'r')
hold on;
lsim(h12,data.u,timeyy(data))
legend("y_{real}","y_{aprx}")
%%
load("z_dataset_1dof_azi_02.mat")
plot(z_dataset_1dof_azi_02)
y=z_dataset_1dof_azi_02.y(:,2);
u=z_dataset_1dof_azi_02.u(:,1);
id=iddata(y,u,0.01);
% plot(id)

h21=tfest(id,3);
figure
plot(timeyy(id),id.y,'r')
hold on;
lsim(h21,id.u,timeyy(id))
legend("y_{real}","y_{aprx}")
%%
load("02AzimuthOpenLoop")
t=SD1.time;
% azi=SD1.signals(1).values;
pitch=SD1.signals(2).values;
% plot(t,azi,'r')

figure
plot(t,pitch,'r')
hold on;
lsim(h21,0.2*ones(length(t),1),t)
legend("y_{real}","y_{aprx}")