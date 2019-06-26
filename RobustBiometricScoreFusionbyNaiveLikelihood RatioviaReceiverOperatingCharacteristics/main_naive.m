feature=load('score_finger');
fns=feature.score_finger;
feature= load('score_iris');
irs= feature.sim;
feature= load('score_face');
fcs=feature.score_face;
k=2;
cg=1;
ci=1;
for i=1:100
    for j=1:100
        if i==j
            gen(cg,1)=irs(i,j);
            gen(cg,2)=fns(i,j);
            gen(cg,3)=fcs(i,j);
            cg=cg+1;
        else
            imp(ci,1)=irs(i,j);
            imp(ci,2)=fns(i,j);
            imp(ci,3)=fcs(i,j);
            ci=ci+1;
        end
    end
end

genmean= mean(gen);
impmean = mean(imp);
gencov = std(gen);
impcov = std(imp);

for i=1:100
    temp=0;
    for j=1:k
        nm1(i,j) = get_density(gen(i,j),genmean(1,j),gencov(1,j));
        dn1(i,j) = get_density(gen(i,j),impmean(1,j),impcov(1,j));
        t1=log(nm1(i,j)/dn1(i,j));
        temp=temp+t1;
    end
    naive_gen(i)=temp;
end
for i=1:9900
    temp=0;
    for j=1:k
        nm2(i,j) = get_density(imp(i,j),genmean(1,j),gencov(1,j));
        dn2(i,j) = get_density(imp(i,j),impmean(1,j),impcov(1,j));
        t1=log(nm2(i,j)/dn2(i,j));
        temp=temp+t1;
    end
    naive_imp(i)=temp;
end
naive_gen = transpose(naive_gen);
naive_imp = transpose(naive_imp);
[EER,op] = EER_DET_conf(naive_gen,naive_imp,0.2,10000);
num= abs(mean(naive_gen)-mean(naive_imp));
den = sqrt(var(naive_gen)^2 + var(naive_imp)^2);
diffrentiability= num/den;