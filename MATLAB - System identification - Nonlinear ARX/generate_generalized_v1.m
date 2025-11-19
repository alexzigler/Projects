function philine = generate_generalized_v1(inputvectorX,m)
X=inputvectorX;
N=length(X);

philine=zeros(1,mlen(m,N));
% philine=[];
j=1;
    kline=zeros(1,N);
    for k=1:(m+1)^(N)
        s=0;
        for i=N:-1:1
            kline(i)=mod(floor((k-1)/((m+1)^(N-i))),m+1);
            s=s+kline(i);
            if s>m
                s=-1;
                break
            end
        end
        if s==-1
            continue
        elseif s<=m
%             philine= [philine,prod(X.^kline)];% x^p1 * x^p2 * x^p3 * ...
              philine(j)=prod(X.^kline);
              j=j+1;
    %         matrix=[matrix;kline];
        end
        
        if j==mlen(m,N)+1
            return
        end

    end
%     philine=mline;


end

