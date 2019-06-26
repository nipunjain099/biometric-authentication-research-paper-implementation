test_feature =load('fused_test_feature2');
test_feature=test_feature.fused_test_feature2;
train_feature =load('fused_train_feature2');
train_feature=train_feature.fused_train_feature2;
t1=zeros(20,480);
fa=zeros(30,1);
fr=zeros(30,1);
threshold=0.1;
for k=1:30;
    threshold=threshold+0.01;v 
    far=0;
    frr=0;
    for i=1:100
        tm=gethammingdistance(cell2mat(test_feature(i,2)), t1,cell2mat(train_feature(i,2)), t1, 10);
        tt=gethammingdistance(cell2mat(test_feature(i,1)), t1,cell2mat(train_feature(i,1)), t1, 10);
        tt=tt*tm;
        if tt>threshold
            frr=frr+1;
        end
        for j = 1:100
            tm=gethammingdistance(cell2mat(test_feature(j,2)), t1,cell2mat(train_feature(i,2)), t1, 10);
            t=gethammingdistance(cell2mat(test_feature(j,1)), t1,cell2mat(train_feature(i,1)), t1, 10);
            t=t*tm;
            if t<threshold && i~=j
                far=far+1;
            end
        end
    end
    frr=frr/100;
    far=far/9900;
    fr(k)=frr;
    fa(k)=far;
end;
figure;
hold on;
plot(fa, fr,'-');
axis([0 1 0 1]);