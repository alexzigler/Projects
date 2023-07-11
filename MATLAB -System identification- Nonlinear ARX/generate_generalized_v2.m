function philine = generate_generalized_v2(inputvectorX,m)
X=inputvectorX;
N=length(X);
philine=[];

% combs=[];
row=zeros(1,N);

flag=logical(row);

while ~all(flag)
    if sum(row)<=m
%         combs=[combs;row];
        philine=[philine;prod(X.^row)];
    end
    row(end)=row(end)+1;
    flag=false(1,N);
    if row(end)==m+1
        flag(end)=1;
        for q=1:N
            if row(q)==m
                flag(q)=1;
            end
        end
        k=find(~flag,1,'last');
        row(k)=row(k)+1;
        
        row(k+1:end)=0;
%         row(k-1)=row(k-1)+1;
        
    end
end


end
