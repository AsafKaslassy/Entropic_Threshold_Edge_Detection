function [g]=EdgeDetector(f)
[M,N]=size(f);
g=ones(M,N);
for y=2 : N-1
    for x=2 : M-1
        sum1=0;
        for k=-1:1
            for j=-1:1
                if(f(x,y)==f(x+j,y+k))
                    sum1=sum1+1;
                end
            end
        end
        if (sum1<=6)
            g(x,y)=0;
        end
    end
end