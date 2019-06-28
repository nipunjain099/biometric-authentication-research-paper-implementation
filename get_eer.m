function [far,frr] =  get_eer(gen,imp,t)
far=0;
frr=0;
for i =1:100
    if gen(i)>t
        frr = frr+1;
    end
end
for i=1:9900
    if imp(i)<t
        far=far+1;
    end
    end
frr = frr/1
far = far/99