test_feature =load('fused_test_feature2');
test_feature=test_feature.fused_test_feature2;
train_feature =load('fused_train_feature2');
train_feature=train_feature.fused_train_feature2;
genuine=zeros(100,1);
imposter=zeros(9900,1);
cg=1;
ci=1;
for i=1:100
    for j=1:100
        if i==j
            tm=gethammingdistance(cell2mat(test_feature(i,2)), t1,cell2mat(train_feature(j,2)), t1, 10);
            tt=gethammingdistance(cell2mat(test_feature(i,1)), t1,cell2mat(train_feature(j,1)), t1, 10);
            tt=tt+tm;
            tt=tt/2;
            genuine(cg,1)=1-tt;
            cg=cg+1;
        else
            tm=gethammingdistance(cell2mat(test_feature(i,2)), t1,cell2mat(train_feature(j,2)), t1, 10);
            tt=gethammingdistance(cell2mat(test_feature(i,1)), t1,cell2mat(train_feature(j,1)), t1, 10);
            tt=tt+tm;
            tt=tt/2;
            imposter(ci,1)=1-tt;
            ci=ci+1;
        end
    end
end
[EER, OP]=EER_DET_conf(genuine,imposter,0.1,10000);
diff = abs(mean(genuine) - mean(imposter)) / abs(std(genuine) - std(imposter));