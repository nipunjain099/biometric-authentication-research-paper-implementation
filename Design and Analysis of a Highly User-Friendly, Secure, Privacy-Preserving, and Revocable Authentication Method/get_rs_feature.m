function iris_rs_feature = get_rs_feature(type)
%return cell containing feature
iris_rs_feature = cell(1,2);
if(strcmp(type,'train'))
    t=1;
else
    t=2;
end
s=strcat('0',num2str(t),'1_L (' ,num2str(1) ,').bmp');
[template, mask] = createiristemplate(s);
iris_rs_feature{1,1}=template;
iris_rs_feature{1,2}=mask;

save(strcat('iris_rs_',type,'_feature.mat'),'iris_rs_feature');