function [a,c,b] = set_genrator(gen,imp,gnr,np,f,cr)
% genrates the ideal parameters
% gen = genuine score
% imp=imposter score
% gnr= max. number of genrations
% np= 1 genration size
% f= [0,1]
% cr = crossover rate =[0,1]
d=3;
p=zeros(gnr+1,np,3);
h=zeros(gnr+1,np);
u=zeros(gnr+1,np,3);
eer=eercal(gen,imp,0.1,10000);
far1=min(imp);
far0=max(imp);
frr1=max(gen);
frr0=min(gen);
for i=1:np
    temp=sort([rand(),rand(),rand()]);
    p(1,i,1)=temp(1);
    p(1,i,2)=temp(2);
    p(1,i,3)=temp(3);
    h(1,i)=fratio(gen,imp,p(1,i,:),eer,frr1,frr0,far1,far0);
end
for g=1:gnr
    for i =1:np
        temp=randperm(np);
        if temp(1) ~= i
            r1=temp(1);
        else
            r1=temp(4);
        end
        if temp(2) ~= i
            r2=temp(2);
        else
            r2=temp(4);
        end
        if temp(3) ~= i
            r3=temp(3);
        else
            r3=temp(4);
        end
        jrand=randi(d,1,1);
        for j=1:d
            if j==jrand || rand() <= cr
                u(g,i,j)=p(g,r1,j)+ f*(p(g,r2,j)-p(g,r3,j));
                u(g,i,j)=min(u(g,i,j),1);
                u(g,i,j)=max(u(g,i,j),0);
            else
                u(g,i,j)=p(g,i,j);
            end
        end
        u(g,i,:) = sort(u(g,i,:));
        h(g,i)=fratio(gen,imp,p(g,i,:),eer,frr1,frr0,far1,far0);
        if g==1
            p(g+1,i,:)=p(g,i,:);
            h(g+1,i)=h(g,i);
        else
            if h(g-1,i)<=h(g,i)
                p(g+1,i,:)=u(g,i,:);
                h(g+1,i)=h(g,i);
            else
                p(g+1,i,:)=p(g,i,:);
                h(g+1,i)=h(g-1,i);
            end
        end
    end
    [val, idx] = max(h(gnr+1,:));
    a= p(gnr+1,idx,1);
    b= p(gnr+1,idx,3);
    c= p(gnr+1,idx,2);
end