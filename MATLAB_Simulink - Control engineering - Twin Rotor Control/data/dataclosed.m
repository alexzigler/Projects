load("005Hertz035AmpAzimuthClosedLoop")

t=AngleCtrl.time;

z=AngleCtrl.signals(3).values;
u=z(:,1);
y=z(:,2);
z_closed_Azi035=iddata(y,u,0.01);
%%
load("005Hertz20AmpAzimuthClosedLoop")

t=AngleCtrl.time;

z=AngleCtrl.signals(3).values;
u=z(:,1);
y=z(:,2);
z_closed_Azi02=iddata(y,u,0.01);
%%
load("005Hertz12AmpAzimuthClosedLoop")
t=AngleCtrl.time;

z=AngleCtrl.signals(3).values;
u=z(:,1);
y=z(:,2);
z_closed_Azi1_2=iddata(y,u,0.01);
%%
load("005Hertz07AmpAzimuthClosedLoop")
t=AngleCtrl.time;

z=AngleCtrl.signals(3).values;
u=z(:,1);
y=z(:,2);
z_closed_Azi07=iddata(y,u,0.01);
%%
load("005Hertz01AmpAzimuthClosedLoop")
t=AngleCtrl.time;

z=AngleCtrl.signals(3).values;
u=z(:,1);
y=z(:,2);
z_closed_Azi01=iddata(y,u,0.01);
%% pitch
load("005Hertz07AmpPitchClosedLoop")
t=AngleCtrl.time;

z=AngleCtrl.signals(3).values;
u=z(:,1);
y=z(:,2);
z_closed_Pitch07=iddata(y,u,0.01);
%%
load("005Hertz05AmpPitchClosedLoop")
t=AngleCtrl.time;

z=AngleCtrl.signals(3).values;
u=z(:,1);
y=z(:,2);
z_closed_Pitch05=iddata(y,u,0.01);
%%
load("005Hertz03AmpPitchClosedLoop")
t=AngleCtrl.time;

z=AngleCtrl.signals(3).values;
u=z(:,1);
y=z(:,2);
z_closed_Pitch03=iddata(y,u,0.01);
%%
load("005Hertz02AmpPitchClosedLoop")
t=AngleCtrl.time;

z=AngleCtrl.signals(3).values;
u=z(:,1);
y=z(:,2);
z_closed_Pitch02=iddata(y,u,0.01);
%%
load("005Hertz01AmpPitchClosedLoop")
t=AngleCtrl.time;

z=AngleCtrl.signals(3).values;
u=z(:,1);
y=z(:,2);
z_closed_Pitch01=iddata(y,u,0.01);
