function score=match_biometric(query,template)
% query = cell2mat(query);
template = cell2mat(template);
score=1-norm(template-query)/(norm(template)+norm(query));
end