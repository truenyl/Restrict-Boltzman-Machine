% º∆À„À∆»ª÷µ

function Prob=PROB(a,b,W,test,logZ)
% F=length(a);
% D=length(b);
logPv=0;
Prob=0;
for m=1:100
    for n=1:100
        v=test(m,:,n);
        logPv=logPv+b*v'+sum(log(1+exp(a+v*W)))-logZ;
        Prob=Prob+exp(logPv);
        logPv=0;
    end
end
Prob
        