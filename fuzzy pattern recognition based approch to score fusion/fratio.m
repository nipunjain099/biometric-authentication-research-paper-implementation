function [score] = fratio(gen,imp,par,eer,frr1,frr0,far1,far0)
[genfuzz,impfuzz] = fuzzy_score(gen,imp,par,eer,frr1,frr0,far1,far0);
score=(mean(genfuzz)-mean(impfuzz))/(std(genfuzz)+std(impfuzz));