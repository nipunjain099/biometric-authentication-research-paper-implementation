function [far,frr] = get_eer(gen,imp,thresh)
far=0;
frr=0;
for i=1:100
    if gen(i)<thresh
        frr=frr+1;
    end
end
for i =1:9900
    if imp(i)>thresh
        far=far+1;
    end
end
frr=frr/100
far=far/9900