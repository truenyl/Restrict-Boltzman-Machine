function log_Pk_star=log_Pk(v,Beta,aA,bA,aB,bB,WB)
part1=bA*v';
part2=0;
part3=0;
prodW=v*WB;
% for j=1:length(aA)
%     part2=part2+log(1+exp((1-Beta)*aA(j)));
% end
part2=sum(log(1+exp((1-Beta)*aA)));
% for j=1:length(aB)
%     part3=part3+log(1+exp(Beta*(prodW(j)+aB(j))));
% end
part3=sum(log(1+exp(Beta*(prodW+aB))));
log_Pk_star=part1+part2+part3;