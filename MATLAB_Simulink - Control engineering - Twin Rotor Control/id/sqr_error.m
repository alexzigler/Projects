function mse = sqr_error(signal1,signal2)
    if length(signal1)~=length(signal2)
        mse=-1;
        return
    end
    s=0;
    for i=1:length(signal1)
        s=s+(signal1(i)-signal2(i))^2;
    end
    mse=s/length(signal1);
end

