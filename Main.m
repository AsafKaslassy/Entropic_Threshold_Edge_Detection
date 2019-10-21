clear

I=imread('Lena.tif'); % read the grayscale image
[M,N]=size(I);  % get dimantions
p = zeros(256,3); % init 3d matrix

for ii=1:256 % init indexs of gray levels 0..255
    p(ii,1)=ii-1;
end
p(:,2) = imhist(I); % take the values from the histogram

p (p(:,2)==0,:) = []; % remove zero entries in p

% Calling Shannon procedure, return t1 value and its location in p
[T1,Loc]=Shannon(p);
% Calling Tsallis procedure of Part1
debug=zeros(M,N);
for i=1:M
    for j=1:N
        if (I(i,j)>T1)
            debug(i,j)=1; 
        end
    end
end
imwrite(debug,'leana_shennon_smallert1.tif');
pLow= p(1:Loc,:);
T2= Tsallis_Sqrt(pLow);
debug1=zeros(M,N);
for i=1:M
    for j=1:N
        if ((I(i,j)>= T2) & (I(i,j)<T1))
            debug1(i,j)=1; 
        end
    end
end
imwrite(debug1,'leana_shennon_tsallil_smallert1biggert2.tif');

% Calling Tsallis procedure of Part2
pHigh=p(Loc+1:size(p),:);
T3=Tsallis_Sqrt(pHigh);

debug2=zeros(M,N);
for i=1:M
    for j=1:N
        if ((I(i,j)>= T3))
            debug2(i,j)=1; 
        end
    end
end
imwrite(debug2,'leana_shennon_tsallil_biggert3.tif');


% Cerate binary matrices f
f=zeros(M,N);
for i=1:M
    for j=1:N
        if ((I(i,j)>= T2) & (I(i,j)<T1)) | (I(i,j)>= T3)
            f(i,j)=1; 
        end
    end
end


% Calling EdgeDetector procedure, return edge detection image.
[g]= EdgeDetector(f);
figure;
imshow(g);
imwrite(g, 'lenaEdge.tif')