feature=load('score_finger');
fs=feature.score_finger;
feature= load('score_iris');
irs= feature.sim;
feature= load('score_face');
fcs=feature.score_face;
cg=1;
ci=1;
for i=1:100
    for j=1:100
        if i==j
            geni(cg)=irs(i,j);
            genf(cg)=fs(i,j);
            genfc(cg)=fcs(i,j);
            cg=cg+1;
        else
            impi(ci)=irs(i,j);
            impf(ci)=fs(i,j);
            impfc(ci)=fs(i,j);
            ci=ci+1;
        end
    end
end
eeri=eercal(geni,impi,0.1,10000);
far1i=min(impi);
far0i=max(impi);
frr1i=max(geni);
frr0i=min(geni);

eerf=eercal(genf,impf,0.1,10000);
far1f=min(impf);
far0f=max(impf);
frr1f=max(genf);
frr0f=min(genf);

eerfc=eercal(genfc,impfc,0.1,10000);
far1fc=min(impfc);
far0fc=max(impfc);
frr1fc=max(genfc);
frr0fc=min(genfc);

[a1,c1,b1]=set_genrator(geni,impi,100,50,0.5,0.5);
[a2,c2,b2]=set_genrator(genf,impf,100,50,0.5,0.5);
[a3,c3,b3]=set_genrator(genfc,impfc,100,50,0.5,0.5);
fuzzy_score=zeros(100,100);
for i=1:100
    for j=1:100
        t1=get_fuzzyscore(irs(i,j),a1,c1,b1,eeri,frr1i,frr0i,far1i,far0i);
        t2=get_fuzzyscore(fs(i,j),a2,c2,b2,eerf,frr1f,frr0f,far1f,far0f);
        t3=get_fuzzyscore(fcs(i,j),a3,c3,b3,eerfc,frr1fc,frr0fc,far1fc,far0fc);
        fuzzy_score(i,j)=sqrt(t1^2 + t2^2 + t3^2);
    end
end
save('fuzzy_score1.mat','fuzzy_score');