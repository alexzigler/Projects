%
A=[1 1;0 1]; %n x n
B=[0.5;1]; %n x m
C=[1 0]; %p x n
n=size(A,1);
m=size(B,2);
p=size(C,1);
Np=10;
Nc=3;
%%
Phi_a=[A,zeros(n,p);C*A,eye(p)];
Gamma_a=[B;C*B];
C_a=[zeros(p,n),eye(p)];
W=[];
for i=1:Np
    W=[W;C_a*Phi_a^i];
end
Z=zeros(Np,Np);
for i=1:Np
    for j=1:Np
        if(i>=j)
            % Z((n+p)*(i-1)+1:(n+p)*i,m*(j-1)+1:m*j)=(Phi_a)^(i-j)*Gamma_a;
            Z(i,j)=C_a*(Phi_a)^(i-j)*Gamma_a;
        end
    end
end
Z=Z(1:end,1:Nc);
%%
r=2;
R=0.1*eye(Nc);
Q=1*eye(Np);

endsim=15;
xv=zeros(n,endsim);
uv=zeros(m,endsim);

for k=1:endsim
    % x_kp1=A*xv(k)+B*uv(k);
    y_k=C*xv(:,k);
    if k==1
        deltax_k=xv(:,k);
    else
        deltax_k=xv(:,k)-xv(:,k-1);
    end
    xa_k=[deltax_k;y_k];

    deltaUstar=inv(R+Z'*Q*Z)*Z'*Q*(r-W*xa_k);
    deltau_k=deltaUstar(1);
    if k==1
        uv(k)=deltau_k;
    else
        uv(:,k)=deltau_k+uv(k-1);
    end
    xv(:,k+1)=A*xv(:,k)+B*uv(k);
end
figure
plot(1:endsim,xv(1,1:end-1))
grid,title("states")
figure
plot(1:endsim,uv(1,1:end))
grid,title("control")



