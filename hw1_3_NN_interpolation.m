clear all;
I=imread('data\panda_gray.jpg');
[M N c] = size(I);
factor=4;
I_NN = uint8(zeros(M*factor, N*factor));
 
for i= 0:M*factor-1
  for j= 0:N*factor-1
    x = floor(j/factor);
    y = floor(i/factor);
    for k= 1:c
      I_NN(i+1, j+1, k) = I(y+1, x+1, k);
    end
  end
end



figure(1);
imshow(I);
title('Original');
figure(2);
imshow(I_NN);
title('Interpolation');


