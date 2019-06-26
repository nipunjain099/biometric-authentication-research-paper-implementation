feature=load('score_finger');
fs=feature.score_finger;
feature= load('score_iris');
irs= feature.sim;
k=2;
cg=1;
ci=1;
for i=1:100
    for j=1:100
        if i==j
            gen(cg,1)=irs(i,j);
            gen(cg,2)=fs(i,j);
            cg=cg+1;
        else
            imp(ci,1)=irs(i,j);
            imp(ci,2)=fs(i,j);
            ci=ci+1;
        end
    end
end
genmean= mean(gen);
impmean = mean(imp);
gencov = cov(gen);
impcov = cov(imp);

for i=1:100
    gen_denscore(i) = get_density(k,gen(i,:),genmean,gencov) / get_density(k,gen(i,:),impmean,impcov);
end
for i=1:9900
    imp_denscore(i) = get_density(k,imp(i,:),genmean,gencov) / get_density(k,imp(i,:),impmean,impcov);
end
% genmn2=mean(gen_denscore);
%   impmn2=mean(imp_denscore);