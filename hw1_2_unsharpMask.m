clear all;

I =imread('data\garden_gray.jpg');
J =imread('data\garden_gray.jpg');
K =imread('data\garden_gray.jpg');
figure,subplot 121, imshow(I);title('Original');
kernel=[1/16 2/16 1/16;2/16 4/16 4/16;1/16 2/16 1/16];
[M,N]=size(I);
A=zeros(size(I));
A2=zeros(size(I));
fliter=zeros(size(I));
i=(3-1)/2;
j=(3-1)/2;
for x=1:M 
    for y=1:N 
        for v=1:3 
             mm = 3-v +1; 
            for w=1:3 
                nn = 3-w+1;
                ii = x + (v - i)+1;
                jj = y + (w - j)+1;
                if( ii > 0 && ii <= M && jj > 0 && jj <= N )
                     A(x,y) = A(x,y)+(I(ii,jj)*kernel(mm,nn));
                end
            end
        end
         I(x,y) = A(x,y);
         K(x,y)=2*J(x,y)-I(x,y);
    end
    
end
subplot 122,imshow(K); title('UnsharpMask');