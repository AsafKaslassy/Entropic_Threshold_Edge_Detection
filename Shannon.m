function [T,Loc]=Shannon(p)
p(:,3) = p(:,2)./ sum(p(:,2)); % normalize p so that sum(p) is one.
[M1, N1]=size(p);
Max1= 0;
for t=1 : size(p)
    PA= sum(p(1:t,3));
    PB= 1-PA ;
    p1=p(1:t,3)./PA; % p1 is i probability in PA
    p2=p(t+1:M1,3)./PB; %p2 is i prob. in PB
    Sa= -sum(p1.*log2(p1));
    Sb= -sum(p2.*log2(p2));
    Sab= Sa + Sb;
    if(Sab>Max1) 
        T=p(t,1);
        Loc=t;
        Max1=Sab;
    end
end