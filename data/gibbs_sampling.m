% gibbs²ÉÑù

function [v_new,h]=gibbs_sampling(v,Beta,aA,bA,aB,bB,WB)
p_hA=1./(1+exp(-(1-Beta)*aA));
p_hB=1./(1+exp(-Beta*(v*WB+aB)));

hB=p_hB > rand(1,length(aB));

p_new_v=1./(1+exp(-(1-Beta)*bA-Beta*(hB*WB'+bB)));
v_new=p_new_v > rand(1,length(bB));
h=hB;
end