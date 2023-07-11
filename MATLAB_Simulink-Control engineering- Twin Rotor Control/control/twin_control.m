load('transfer_fcn_MIMO.mat')

detG=G(1,1)*G(2,2)-G(1,2)*G(2,1);

%% 1 
% 
% H11=detG;
% H22=detG*tf([1 -0.0652],1);

H11=tf(1,1);
H22=tf(1,1);

z1=8.616500396552560 + 0.000000000000000i;
z2=0.600798348991801 + 0.000000000000000i;

p1h11=-0.951635140193645 + 0.000000000000000i;
p2h11=-4.658621193934844e-04 + 0.000000000000000e+00i;
p3h11=-0.369565329715308 + 0.451503972626077i;
p4h11=-0.369565329715308 - 0.451503972626077i;


p1h22=-2.017839737557058 + 0.000000000000000i;
p2h22=-0.568919779769779 + 0.000000000000000i;
p3h22=-0.228200852820570 + 1.923202888269197i;
p4h22=-0.228200852820570 - 1.923202888269197i;


% c111=conv([1 -p1h11],[1 -p2h11]);
c111=[1 -p1h11];
c112=conv([1 -p3h11],[1 -p4h11]);

c221=conv([1 -p1h22],[1 -p2h22]);
c222=conv([1 -p3h22],[1 -p4h22]);

H11=tf(conv([1 -z1],[1 -z2]),conv(c111,c112));
H22=tf(conv([1 -z1],[1 -z2]),conv(c221,c222));

D11=1/detG*G(2,2)*H11;

D12=-1/detG*G(1,2)*H22;

D21=-1/detG*G(2,1)*H11;

D22=1/detG*G(1,1)*H22;



% D11=G(2,2);
% 
% D12=-G(1,2)*tf([1 -0.0652],1);
% 
% D21=-G(2,1);
% 
% D22=G(1,1)*tf([1 -0.0652],1);

D11=minreal(D11);
D12=minreal(D12);
D21=minreal(D21);
D22=minreal(D22);

nums={D11.Numerator{1},D12.Numerator{1};D21.Numerator{1},D22.Numerator{1}};
dens={D11.Denominator{1},D12.Denominator{1};D21.Denominator{1},D22.Denominator{1}};

D=tf(nums,dens);
%%
figure
subplot(221)
step(D11)

subplot(222)
step(D12)

subplot(223)
step(D21)

subplot(224)
step(D22)
%% phase margin H11

% phi = -180+15+80;
% bode(H11)
% w=125;
% kdb=41.9;
% k=db2mag(kdb);
% Ti=4/w;
% 
% % k=0.006;
% kp=0.01619;
% ki=0.009222;
% % Hr=tf(k*[Ti,1],[Ti 0]);
% Hr=tf([kp,ki],[1 0]);
% Hd=series(H11,Hr);
% Ho=feedback(Hd,1);
% figure
% step(Ho)