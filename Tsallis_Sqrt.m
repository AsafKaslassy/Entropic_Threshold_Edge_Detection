function [T]=Tsallis_Sqrt(p)
p(:,3) = p(:,2)./ sum(p(:,2)); % normalize p so that sum(p) is one.
[M1, N1]=size(p);
Max1= 0;
for t=1 : M1
    PA= sum(p(1:t,3));
    PB= 1-PA ;
    p1= p(1:t ,3)./PA;
    p2= p(t+1 :M1 ,3)./PB;
    Tab= sum( sqrt(p1)) * sum( sqrt(p2) ) - 1;
    if ( Tab > Max1 ) 
        T=p(t,1);
        Max1=Tab;
    end
end