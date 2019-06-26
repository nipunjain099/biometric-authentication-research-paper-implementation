function iris_user_feature = get_user_feature(type,size)
%return cell containing feature
iris_user_feature = cell(size,2);
if(strcmp(type,'train'))
    t=1;
else
    t=2;
end
for i=2:size+1
    s=strcat('0',num2str(t),'1_L (' ,num2str(i) ,').bmp');
    [template, mask] = createiristemplate(s);
    iris_user_feature{i,1}=template;
    iris_user_feature{i,2}=mask;
end

save(strcat('iris_user_',type,'_feature.mat'),'iris_user_feature');