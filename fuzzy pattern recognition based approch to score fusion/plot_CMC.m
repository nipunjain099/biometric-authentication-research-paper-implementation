function plot_CMC(score,rank_limit)
% makes the cmc curve
% score = score matrix
% rank_limit = x axis range of ranks
for i=1:100
    ct=1;
    for j=1:100
        if i~=j
            if score(i,j)>score(i,i)
                ct=ct+1;
            end
        end
    end
    rk(i)=ct;
end
ct=0;
for i=1:rank_limit
    t= rk==i;
    t1=sum(t);
    t1=sum(t1);
    ct= ct+ t1;
    y(i,1)=ct/100;
    x(i,1)=i;
end
figure
plot(x,y);