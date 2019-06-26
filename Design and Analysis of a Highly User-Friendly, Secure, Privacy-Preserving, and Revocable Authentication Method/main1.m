[t,m,rs_polar_array,rs_noise_array]=createiristemplate('02_L (1).bmp');
[m,n]=size(rs_polar_array);
signature=get_signature(n);
fused_train_feature2 = cell(100,2);
for i=1:100
%     for j=1:3
        s=strcat('F:\drdo\code\IITD Database\' ,num2str(i) ,'\01_L.bmp');
        [template, mask] = fusedtemplate(s,rs_polar_array,rs_noise_array,signature);
        fused_train_feature2{i,1}=template;
        fused_train_feature2{i,2}=mask;
%     end
end

save('fused_train_feature2.mat','fused_train_feature2');

[t,m,rs_polar_array,rs_noise_array]=createiristemplate('01_L (1).bmp');
[m,n]=size(rs_polar_array);
fused_test_feature2 = cell(100,2);
for i=1:100
%     for j=4:5  
        s=strcat('F:\drdo\code\IITD Database\' ,num2str(i) ,'\02_L.bmp');
        [template, mask] = fusedtemplate(s,rs_polar_array,rs_noise_array,signature);
        fused_test_feature2{i,1}=template;
        fused_test_feature2{i,2}=mask;
%     end
end

save('fused_test_feature2.mat','fused_test_feature2');