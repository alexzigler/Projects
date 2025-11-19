clear
load("set 02 azimuth_ 0 ic")
t=azimuth.time;
azimuth1=azimuth.signals(1).values;
pitch1=azimuth.signals(2).values;
Y=[azimuth1,pitch1];
U=[sqwerty(0.2,8,t)',zeros(length(azimuth1),1)];


z_dataset_1dof_azi_02=iddata(Y,U,t(2));

%%
clear
load("set 02 pitch")
t=azimuth.time;
azimuth1=azimuth.signals(1).values;
pitch1=azimuth.signals(2).values;
Y=[azimuth1,pitch1];
U=[zeros(length(azimuth1),1),sqwerty(0.2,8,t)'];


z_dataset_1dof_pitch_02=iddata(Y,U,t(2));
%%
clear
load("both02_pitch_reversed_pwm(gain-1)")
t=azimuth.time;
azimuth1=azimuth.signals(1).values;
pitch1=azimuth.signals(2).values;
Y=[azimuth1,pitch1];
U=[sqwerty(0.2,8,t)',-sqwerty(0.2,8,t)'];

z_dataset_2dof_azi_02_pitch_minus02=iddata(Y,U,t(2));
plot(z_dataset_2dof_azi_02_pitch_minus02)

%%
load("01 full azimuth_square02 pitch")
t=azimuth.time;
azimuth1=azimuth.signals(1).values;
pitch1=azimuth.signals(2).values;


Y=[azimuth1,pitch1];
U=[0.1*ones(length(azimuth1),1),sqwerty(0.2,8,t)'];
z_dataset_2dof_azi_01step_pitch_02square=iddata(Y,U,t(2));
%% 
clear
load("01 full pitch_square02 azimuth")
t=azimuth.time;
azimuth1=azimuth.signals(1).values;
pitch1=azimuth.signals(2).values;

rpm_azi=pitch.signals(1).values;
rpm_pitch=pitch.signals(2).values;

Y=[azimuth1,pitch1];
U=[sqwerty(0.2,8,t)',0.1*ones(length(azimuth1),1)];
z_dataset_2dof_azi_02square_pitch_01step=iddata(Y,U,t(2));
%% 2dof 02 02
clear
load("square02_02pitch+azimuth1pe8f")
t=dataangles1.time;
azi=dataangles1.signals(1).values;
pitch=dataangles1.signals(2).values;

Y=[azi,pitch];
U=[sqwerty(0.2,8,t)',sqwerty(0.2,8,t)'];

z_dataset_2dof_azi02square_pitch02square=iddata(Y,U,t(2));

%% 1dof 025 azi
clear
load("square025Azimuth_1pe8f")
t=dataangles1.time;
azi=dataangles1.signals(1).values;
pitch=dataangles1.signals(2).values;

plot(t,azi)
%no