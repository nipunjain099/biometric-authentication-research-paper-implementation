test_feature =load('fused_test_feature2');
test_feature=test_feature.fused_test_feature2;
train_feature =load('fused_train_feature2');
train_feature=train_feature.fused_train_feature2;
hd=zeros(100,3);
t1=zeros(20,480);
threshold=0.2715;
far=0;
frr=0;
% t1 = t1+1;
for i=1:100
    tm=gethammingdistance(cell2mat(test_feature(i,2)), t1,cell2mat(train_feature(i,2)), t1, 1);
    hd(i,1)=gethammingdistance(cell2mat(test_feature(i,1)), t1,cell2mat(train_feature(i,1)), t1, 1);
%     hd(i-1,1)=gethammingdistance(cell2mat(test_feature(i,1)), cell2mat(test_feature(i,2)),cell2mat(train_feature(i,1)), cell2mat(train_feature(i,2)), 1);
    hd(i,1)=hd(i,1)+tm;
    hd(i,1)=hd(i,1)/2;
    hd(i,2)=0;
%     hd(i-1,3)=i;
    if hd(i,1)>threshold
        frr=frr+1;
        hd(i,2)=1;
    end
    ct=0;
    for j = 1:100
        tm=gethammingdistance(cell2mat(test_feature(j,2)), t1,cell2mat(train_feature(i,2)), t1, 1);
        t=gethammingdistance(cell2mat(test_feature(j,1)), t1,cell2mat(train_feature(i,1)), t1, 1);
%         t=gethammingdistance(cell2mat(test_feature(j,1)), cell2mat(test_feature(j,2)),cell2mat(train_feature(i,1)), cell2mat(train_feature(i,2)), 1);
        t=t+tm;
        t=t/2;
        if t<threshold && i~=j
            ct=ct+1;
        end
    end
    far=far+ct;
    hd(i,3)=ct;
end
frr=frr/100;
far=far/9900;