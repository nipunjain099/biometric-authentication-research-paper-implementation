function keys = get_key(feature,signature)
%return key for given feature
[m,n]=size(feature);
t_size=5;
temp_feature= zeros(m,n);
for i = 1:m
    for j = 1:n
        sum=0;
        t_winsize=0;
        if i-t_size>=1
            t1=i-t_size;
        else
            t1=1;
        end
        if i+t_size<=m
            t2=i+t_size;
        else
            t2=m;
        end
        if j-t_size>=1
            t3=j-t_size;
        else
            t3=1;
        end
        if j+t_size<=n
            t4=j+t_size;
        else
            t4=n;
        end
        for k = t1:t2
            for l = t3:t4
                sum= sum + feature(k,l);
                t_winsize= t_winsize+1;
            end
        end
        sum= sum/t_winsize;
        temp_feature(i,j) = abs(feature(i,j)-sum);
    end
end
temp_s = zeros(m,1);
for i = 1:m
    sum=0;
    for j = 1:n
        sum = sum+ temp_feature(i,j);
    end
    temp_s(i,1)=sum/n;
end
v=0;
for i = 1:m
    v=v+temp_s(i,1);
end
v= v/m;
mm=0;
s=zeros(m,1);
for i = 1:m
%     s(i,1)=abs(temp_s(i) - v)+mm;
%     s(i,1)=round(s(i),1);
%     s(i,1)=s(i)*1000;
%     s(i,1)= s(i)+1;
      s(i,1)=1;
end
keys=zeros(m,n);
for i = 1:m
    ar=cell2mat(signature(s(i,1),1));
    for j=1:n
        keys(i,j) = ar(j,1);
    end
end

    
    
        
        