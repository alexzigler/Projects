function rez=mlen(m,N)
rez=0;
for q=0:m 
    rez=rez+factorial(N+q-1)/factorial(q)/factorial(N-1);
end
end