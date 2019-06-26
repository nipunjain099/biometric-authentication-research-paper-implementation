% function signature = get_signature(n)
n=100;
signature = cell(1001,1);
for i=1:1001
    ar=randi(2,n,1);
    for j=1:n
        if ar(j,1)==2
            ar(j,1)=-1;
        end
    end
%         signature{i}=mat2cell(ar);
        signature(i,1) = {ar};
end
save('signature.mat','signature');