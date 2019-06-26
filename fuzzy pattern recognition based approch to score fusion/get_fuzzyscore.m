function [genfuzz] = get_fuzzyscore(x,a,c,b,eer,frr1,frr0,far1,far0)
    if x<=far1
        genfuzz=0;
    elseif x <= frr0
        genfuzz= a*((x-frr0)/(frr0-far1));
    elseif x <= eer
        genfuzz= a+(c-a)*((x-frr0)/(eer-frr0));
    elseif x <= far0
        genfuzz= c+(b-c)*((x-eer)/(far0-eer));
    elseif x < frr1
        genfuzz= b+(1-b)*((x-far0)/(frr1-far0));
    else
        genfuzz=1;
    end