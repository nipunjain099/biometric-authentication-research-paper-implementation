feature=load('score_finger');
sf=feature.score_finger;
feature= load('score_iris');
irf= feature.sim;
fingermean= mean(sf);
fingermean = mean (fingermean);
[m,n] = size(sf);
fingervariance= std(reshape(sf,[m*n,1]));
sfn= (sf-fingermean)/fingervariance;

irismean= mean(irf);
irismean = mean (irismean);
[m,n] = size(irf);
irisvariance= std(reshape(irf,[m*n,1]));
ifn= (irf-irismean)/irisvariance;

fused = 0.4* sfn + 0.6*ifn;
cg=1;
ci=1;
for i =1:100
    for j=1:100
        if i==j
            gen(cg)=fused(i,j);
            cg=cg+1;
        else
            imp(ci)=fused(i,j);
            ci=ci+1;
        end
    end
end
[EER, OP]=EER_DET_conf(gen,imp,0.1,10000);
num= abs(mean(gen)-mean(imp));
den = sqrt(var(gen)^2 + var(imp)^2);
diffrentiability= num/den;