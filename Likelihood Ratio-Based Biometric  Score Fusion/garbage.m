d = 2; 
k = 2; 
n = 100; 
% [X,label] = mixGaussRnd(d,k,n); 
X=transpose(gen);
plotClass(X);

m = floor(n/2); 
X1 = X(:,1:m); 
X2 = X(:,(m+1):end); 
% train 
[z1,model,llh] = mixGaussEm(X1,k); 
figure; 
plot(llh); 
figure; 
plotClass(X1,z1); 
% predict 
z2 = mixGaussPred(X2,model); 
figure; 
plotClass(X2,z2);