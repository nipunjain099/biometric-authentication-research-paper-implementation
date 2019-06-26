function fused_feature = get_ff(user_feature,rs_feature,user_key,rs_key)
%returns fused feature 
[row_size,column_size]=size(user_feature);
fused_feature=zeros(row_size,column_size);
for r = 1:row_size
    for c = 1:column_size
        fused_feature(r,c)= user_feature(r,c)*rs_key(r,c) + rs_feature(r,c)*user_key(r,c);
    end
end
fused_feature = fused_feature/2;
