feature = load('ft_test_face');
test = feature.ft_test_face;
feature = load('ft_train_face');
train = feature.ft_train_face;
gen = zeros(100,1);
imp = zeros(9900,1);
ci=1;
for i=1:100
    for j=1:100
        if i==j
            gen(i,1) = pdist2(transpose(cell2mat(train(i,1))),transpose(cell2mat(test(j,1))),'mahalanobis');
        else
            imp(ci,1) = pdist2(transpose(cell2mat(train(i,1))),transpose(cell2mat(test(j,1))),'mahalanobis');
            ci=ci+1;
        end
    end
end
[gen,imp] = nor(gen,imp);
gen= 1-gen;
imp =1-imp;
[EER, OP]=EER_DET_conf(gen,imp,0.1,10000);