clear all;
I =imread('data\thinker_gray_noised.jpg');
kernel=[1/16 2/16 1/16;2/16 4/16 4/16;1/16 2/16 1/16];
figure,imshow(I);
[M,N]=size(I);
A=zeros(size(I));
i=(3-1)/2;
j=(3-1)/2;
for x=1:M %ROW
    for y=1:N %COL
        for v=1:3 %KROW
             kernelm = 3-v +1; 
            for w=1:3 %KCOL
                kerneln =3-w+1;
                i1 = x + (v-i)+1;
                j1 = y + (w-j)+1;
                if( i1 > 0 && i1 <= M && j1 > 0 && j1 <= N )
                     A(x,y) = A(x,y)+(I(i1,j1)*kernel(kernelm,kerneln));
                end
            end
           
        end
         I(x,y) = A(x,y);
    end
    
end


figure,subplot 121,imshow(I);title('3*3 Kernel'); 

I2 =imread('data\thinker_gray_noised.jpg');
kernel2=zeros(5*5);
B=zeros(size(I2));
kernel2=1/256*[1;4;6;4;1]*[1 4 6 4 1];

[M,N]=size(I2);

i2=(5-1)/2;
j2=(5-1)/2;

for x=1:M %ROW
    for y=1:N %COL
        for v=1:5 %KROW
             kernel2m = 5 - v +1; 
            for w=1:5 %KCOL
                kernel2n = 5 - w+1;
                ii = x + (v - i2)+1;
                jj = y + (w - j2)+1;
                if( ii > 0 && ii <= M && jj > 0 && jj <= N )
                     B(x,y) = B(x,y)+(I(ii,jj)*kernel2(kernel2m,kernel2n));
                end
            end
           
        end
         I2(x,y) = B(x,y);
    end
    
end

subplot 122,imshow(I2);title('5*5 Kernel'); 

