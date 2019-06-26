function [genfuzz,impfuzz] = fuzzy_score(gen,imp,par,eer,frr1,frr0,far1,far0)
a=par(1,1,1);
c=par(1,1,2);
b=par(1,1,3);
[q sz]= size(gen);
for i=1:sz
    x=gen(i);
    if x<=far1
        genfuzz(i)=0;
    elseif x <= frr0
        genfuzz(i)= a*((x-frr0)/(frr0-far1));
    elseif x <= eer
        genfuzz(i)= a+(c-a)*((x-frr0)/(eer-frr0));
    elseif x <= far0
        genfuzz(i)= c+(b-c)*((x-eer)/(far0-eer));
    elseif x < frr1
        genfuzz(i)= b+(1-b)*((x-far0)/(frr1-far0));
    else
        genfuzz(i)=1;
    end
end
[q sz]= size(imp);
for i=1:sz
    x=imp(i);
    if x<=far1
        impfuzz(i)=0;
    elseif x <= frr0
        impfuzz(i)= a*((x-frr0)/(frr0-far1));
    elseif x <= eer
        impfuzz(i)= a+(c-a)*((x-frr0)/(eer-frr0));
    elseif x <= far0
        impfuzz(i)= c+(b-c)*((x-eer)/(far0-eer));
    elseif x < frr1
        impfuzz(i)= b+(1-b)*((x-far0)/(frr1-far0));
    else
        impfuzz(i)=1;
    end
end