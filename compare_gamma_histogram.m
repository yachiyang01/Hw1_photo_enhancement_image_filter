lake=imread('data\ChangKungLake.jpg');

YIQMatrix=uint8(zeros(size(lake)));
for i=1:size(lake,1)
    for j=1:size(lake,2)
        YIQMatrix(i,j,1)=0.299*lake(i,j,1)+0.587*lake(i,j,2)+0.114*lake(i,j,3);
        YIQMatrix(i,j,2)=0.596*lake(i,j,1)-0.275*lake(i,j,2)-0.321*lake(i,j,3);
        YIQMatrix(i,j,3)=0.212*lake(i,j,1)-0.523*lake(i,j,2)+0.311*lake(i,j,3);
    end
end



%choose gamma=0.4 to transform
img2 = double(YIQMatrix()).^(0.4); 
img2 = (img2 - min(img2(:)))./ max(img2(:) - min(img2(:))); 


%choose gamma=2to transform
img3 = double(YIQMatrix()).^(3); 
img3 = (img3 - min(img3(:)))./ max(img3(:) - min(img3(:))); 

%choose gamma=6 to transform
img4 = double(YIQMatrix()).^(6); 
img4 = (img4 - min(img4(:)))./ max(img4(:) - min(img4(:))); 


figure,subplot 221,imhist(YIQMatrix(:,:,1));
title('YIQMatrix_y'); 

subplot 222,imhist(img2(:,:,1)); 
title('Image after Gamma Transform, \gamma = 0.4'); 

subplot 223,imhist(img3(:,:,1));
title('Image after Gamma Transform, \gamma = 2'); 

subplot 224,imhist(img4(:,:,1)); 
title('Image after Gamma Transform, \gamma = 6'); 


figure,subplot 221,imshow(YIQMatrix(:,:,1));
title('YIQMatrix_y'); 

subplot 222,imshow(img2(:,:,1)); 
title('Image after Gamma Transform, \gamma = 0.4'); 

subplot 223,imshow(img3(:,:,1));
title('Image after Gamma Transform, \gamma = 2'); 

subplot 224,imshow(img4(:,:,1)); 
title('Image after Gamma Transform, \gamma = 6'); 
