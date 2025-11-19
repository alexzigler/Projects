function output_vec = generateLine(xone,xtwo,m_order)
len=(m_order+1)*(m_order+2)/2;
output_vec=zeros(1,len);

output_vec(1)=1;
output_vec(2)=xone;
output_vec(3)=xtwo;
i=4;
m_index=2;
while m_index<=m_order
        for q=1:m_index+1
            output_vec(i)=xone^(m_index-q+1)*xtwo^(q-1);
            i=i+1;
        end
        m_index=m_index+1;
end
end

