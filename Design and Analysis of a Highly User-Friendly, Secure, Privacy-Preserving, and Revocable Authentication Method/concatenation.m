function feature = concatenation(feature1,feature2)
[m,n] = size(feature1);
feature1=reshape(feature1,m*n,1);
temp=fix((m*n)/100);
feature1 = feature1(1:(temp*100),:);
feature1=reshape(feature1,temp,100);

[m,n] = size(feature2);
feature2=reshape(feature2,m*n,1);
temp=fix((m*n)/100);
feature2 = feature2(1:(temp*100),:);
feature2=reshape(feature2,temp,100);

feature=cat(1,feature1,feature2);
