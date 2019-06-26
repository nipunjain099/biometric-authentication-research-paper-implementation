score=load('fuzzy_score1');
score=score.fuzzy_score;
ctg=1;
cti=1;
for i=1:100
    for j=1:100
        if i==j
            gen(ctg)=score(i,j);
            ctg=ctg+1;
        else
            imp(cti)=score(i,j);
            cti=cti+1;
        end
    end
end
[EER, OP]=EER_DET_conf(gen,imp,0.1,10000);
num= abs(mean(gen)-mean(imp));
den = sqrt(var(gen)^2 + var(imp)^2);
diffrentiability= num/den;
plot_CMC(score,20)
% cmc,freq distribution, recognition index
