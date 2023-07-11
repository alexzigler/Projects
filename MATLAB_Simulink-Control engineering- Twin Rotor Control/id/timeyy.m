function t = timeyy(data)
    len=length(data.y);
    t=0:data.Ts:(len-1)*data.Ts;
    t=t';
end

