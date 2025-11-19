%% 
load('proj_fit_09.mat')

X1id=id.X{1};
X2id=id.X{2};
Yid=id.Y;

X1val=val.X{1};
X2val=val.X{2};
Yval=val.Y;

Nxid=id.dims(1);
Nxval=val.dims(1);

m_max=40;
mse_vector_id=zeros(1,m_max);
mse_vector_val=zeros(1,m_max);

%% search
% h - grad curent 
for h=1:m_max
    
    mlen=(h+1)*(h+2)/2;
    %identification
    phi_id=zeros(Nxid^2,mlen);

    for k=1:Nxid^2
        x1i=X1id(ceil(k/Nxid));
        if mod(k,Nxid)==0
            x2j=X2id(Nxid);
        else
            x2j=X2id(mod(k,Nxid));
        end
        phi_id(k,:) = generateLine(x1i,x2j,h);
    end

    theta_id = phi_id\Yid(:);
    ghat_id=phi_id*theta_id;
    ghat_id=reshape(ghat_id,[Nxid Nxid]);

    mseid=0;
    for i=1:length(Yid)*length(Yid)
        mseid=mseid+(Yid(i)-ghat_id(i))^2;
    end
    mseid =mseid/length(Yid);
    
    mse_vector_id(h)=mseid;
    
    %validate
    phi_val=zeros(Nxval^2,mlen);
    for k=1:Nxval^2
        x1i=X1val(ceil(k/Nxval));
        if mod(k,Nxval)==0
            x2j=X2val(Nxval);
        else
            x2j=X2val(mod(k,Nxval));
        end
        phi_val(k,:) = generateLine(x1i,x2j,h);
    end
    ghat_val=phi_val*theta_id;
    ghat_val=reshape(ghat_val,[Nxval Nxval]);
    
    mseval=0;
    for i=1:length(Yval)*length(Yval)
        mseval=mseval+(Yval(i)-ghat_val(i))^2;
    end
    mseval =mseval/length(Yval);
    mse_vector_val(h)=mseval;
end
figure
plot(1:h,mse_vector_id)
grid
xlabel("m")
ylabel("mse")
title("Identificare")

figure
plot(1:h,mse_vector_val)
grid
xlabel("m")
ylabel("mse")
title("Validare")

%% mesh

% minval=min(mse_vector_val);
% for b=1:length(mse_vector_val)
%    if mse_vector_val(b)==minval
%        min_index=b;
%    end
% end
min_index=5;
mlen=(min_index+1)*(min_index+2)/2;
    phi_id=zeros(Nxid^2,mlen);

    for k=1:Nxid^2
        x1i=X1id(ceil(k/Nxid));
        if mod(k,Nxid)==0
            x2j=X2id(Nxid);
        else
            x2j=X2id(mod(k,Nxid));
        end
        phi_id(k,:) = generateLine(x1i,x2j,min_index);
    end

    theta_id = phi_id\Yid(:);
    ghat_id=phi_id*theta_id;
    ghat_id=reshape(ghat_id,[Nxid Nxid]);
    figure
    mesh(X1id,X2id,Yid);
    xlabel("X_1")
    ylabel("X_2")
    zlabel("g_{id}(X_1,X_2)")
    title('Identificare - g_{id}')
    figure
    mesh(X1id,X2id,ghat_id);
    title('Identificarea modelului')

    %validate
    phi_val=zeros(Nxval^2,mlen);
    for k=1:Nxval^2
        x1i=X1val(ceil(k/Nxval));
        if mod(k,Nxval)==0
            x2j=X2val(Nxval);
        else
            x2j=X2val(mod(k,Nxval));
        end
        phi_val(k,:) = generateLine(x1i,x2j,min_index);
    end
    ghat_val=phi_val*theta_id;
    ghat_val=reshape(ghat_val,[Nxval Nxval]);
    
    figure

    mesh(X1val,X2val,Yval);%,'EdgeColor','r');
    xlabel("X_1")
    ylabel("X_2")
    zlabel("g_{val}(X_1,X_2)")
    title('Validare - g_{val}')
%     hold on;
    figure
    mesh(X1val,X2val,ghat_val)%,'EdgeColor','b');
%     legend('y','g')
    title('Validarea modelului')
    xlabel("X1")
    ylabel("X2")
    zlabel('$\hat{Y}$','interpreter','latex')

