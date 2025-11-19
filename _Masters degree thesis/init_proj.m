% Add all subfolders of the script's directory to the MATLAB path

% Get the full path of the script
scriptFullPath = mfilename('fullpath');

% Get the folder where the script is located
scriptFolder = fileparts(scriptFullPath);

% Generate a path string including all subfolders
allSubFolders = genpath(scriptFolder);

% Add them to MATLAB path
addpath(allSubFolders);

disp('All subfolders have been added to the MATLAB path.');
 
 eulerlimit=1.3;
 m=1.888;
 % m=2.3;
 b=6.367e-4;%6.317e-4;%thrust
 L=0.225;
 d=1.61e-4;%drag
 J1=1.453e-2;
 J2=1.453e-2;
 J3=2.884e-2;
 g=9.81;
 R=0.127;
 D_transl=diag([0.25,0.25,0.25]);%----
 D_rot=diag([0.3,0.3,0.1]);%----
 Jr=3e-5;%----

 Matrix_angular_velocity2Force = [b b b b; 0 0 b*L, -b*L;b*L,-b*L,0,0;-d,-d,d,d];
 Matrix_Force2angular_velocity = inv(Matrix_angular_velocity2Force);

 %% fb_lin
 A1=[0 1 0 0;0 0 1 0; 0 0 0 1; 0 0 0 0];
 A2=[0 1;0 0];
 B1=[0 0 0 0; 0 0 0 0; 0 0 0 0; 1 0 0 0];
 B2=[0 0 0 0; 0 0 0 0; 0 0 0 0; 0 1 0 0];
 B3=[0 0 0 0; 0 0 0 0; 0 0 0 0; 0 0 1 0];
 B4=[0 0 0 0;0 0 0 1];
 c1=[1 0 0 0];
 c2=[1 0];

 A=blkdiag(A1,A1,A1,A2);
 B=[B1;B2;B3;B4];
 C=blkdiag(c1,c1,c1,c2);
 
 % pole placement
 K=place(A,B,[-2,-3,-4,-5,-2.5,-3.5,-4.5,-5.5,-4,-5,-6,-7,-1,-2]);

 % LQR
 Q_lqr=300*eye(14);
 R_lqr=0.1*eye(4);
 K_lqr=lqr(A,B,Q_lqr,R_lqr);
 %% SMC

 %z
 c_z=1;%25
 eps1=0.8;%5
 eta1=2;%5 

 %psi
 c_psi=1;
 eps2=0.8;
 eta2=2;

 % [x,theta]
 c_1=-11*m;
 c_2=-6*m;
 c_3=1;
 c_4=6;
 eps3=5.5;
 eta3=5;

 % [y,phi]
 c_5=11*m;
 c_6=6*m;
 c_7=1;
 c_8=6;
 eps4=5.5;
 eta4=5;
 %% ASMC
k1=1;
k2=1;
k3=0.7;
k4=5;
k5=5;
k6=10;
K_SMC = diag([k1,k2,k3,k4,k5,k6]);
k_phi=.1;
k_theta=.1;
C_SMC=[5 5 5 1 1 1]';