clear all;
I=imread('data\panda_gray.jpg');
[M N c] = size(I);

factor=4;
I_bilnear = zeros( factor*(M-1)+1, factor*(N-1)+1, c);
for i= 1:M
   for j= 1:N
      I_bilnear(factor*(i-1)+1, factor*(j-1)+1, : ) = I(i, j, : );
   end
end
 
for k= 1:c
    for i= 0:factor: factor*(M-1)+1-factor
        for j= 0:factor:factor*(N-1)+1-factor

        A = I_bilnear(i+1, j+1, k);
        B = I_bilnear(i+1, j+factor+1, k);
        C = I_bilnear(i+factor+1, j+1, k);
        D = I_bilnear(i+factor+1, j+factor+1, k);
        
        a0 = A;
        a1 = double((B-A)/factor);
        a2 = double((C-A)/factor);
        a3 = double((D-C-B+A)/(factor*factor));
            for l= 0:factor
                for m= 0:factor
                    I_bilnear(i+l+1, j+m+1, k) = a0 + a1*m + a2*l + a3*m*l;
                end
            end
        end
    end
end
 
I_bilnear = uint8(I_bilnear);
 

figure(1);
imshow(I);
title('Image Original');
figure(2);
imshow(I_bilnear);
title('Image Interpolada');
