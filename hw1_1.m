lake=imread('data\ChangKungLake.jpg');
figure,imshow(lake(:,:,1));
figure,imhist(lake(:,:,1));
YIQMatrix=uint8(zeros(size(lake)));
for i=1:size(lake,1)
    for j=1:size(lake,2)
        YIQMatrix(i,j,1)=0.299*lake(i,j,1)+0.587*lake(i,j,2)+0.114*lake(i,j,3);
        YIQMatrix(i,j,2)=0.596*lake(i,j,1)-0.275*lake(i,j,2)-0.321*lake(i,j,3);
        YIQMatrix(i,j,3)=0.212*lake(i,j,1)-0.523*lake(i,j,2)+0.311*lake(i,j,3);
    end
end
figure; image(YIQMatrix);title('YIQMatrix image'); 
title('Image after RGB Transform into YIQ '); 
figure;imhist(YIQMatrix(:,:,1));title('YIQMatrix_y'); 
title('Image after RGB Transform into YIQ '); 

%choose gamma=2.5 to transform
img2 = double(YIQMatrix()).^(2.5); 
img2 = (img2 - min(img2(:)))./ max(img2(:) - min(img2(:))); 

figure;imhist(img2(:,:,1)); 
title('Image after Gamma Transform, \gamma = 2.5'); 


RGB=uint8(zeros(size(img2)));
for i=1:size(img2,1)
    for j=1:size(img2,2)
          RGB(i,j,1)=img2(i,j,1)+0.956*YIQMatrix(i,j,2)+0.621*YIQMatrix(i,j,3);
          RGB(i,j,2)=img2(i,j,1)-0.272*YIQMatrix(i,j,2)-0.647*YIQMatrix(i,j,3);
          RGB(i,j,3)=img2(i,j,1)-1.106*YIQMatrix(i,j,2)+1.703*YIQMatrix(i,j,3);
    end
end
figure;imshow(RGB);title('RGB'); 
figure;imhist(RGB(:,:,1));title('rgb_y');

