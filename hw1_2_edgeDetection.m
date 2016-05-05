clear all;
I =imread('data\bellTower_gray.jpg');
doubleImage = im2double(I);
[h, w] = size(doubleImage);
X_Matrix = [1 0 -1; 1 0 -1; -1 0 -1];
Y_Matrix = [1 1 1; 0 0 0; -1 -1 -1];


%X direction & Y direction

for v = 2:484
         for u = 2:297
             sum_x = 0;
              sum_y = 0;
              for i=-1:1
                for j=-1:1
                    sum_x = sum_x + doubleImage(u + i, v + j)* X_Matrix(i + 2,j + 2);
                    sum_y = sum_y + doubleImage(u + i, v + j)* Y_Matrix(i + 2,j + 2);

                end
            end
            image_x(u,v) = sum_x;
             image_y(u,v) = sum_y;

         end;
end




figure,subplot 121,imshow(image_x); title('X- Direction Image');
subplot 122,imshow(image_y);axis image; title('Y- Direction Image');
         
