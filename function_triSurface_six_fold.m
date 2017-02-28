function [normArea1,normArea2,normArea3,TopArea1,BottomArea1,TopArea2, BottomArea2, TopArea3, BottomArea3] = function_triSurface_six_fold(binImg)

[rows , columns] = size(binImg);
id = fix(columns/3);
img1 = binImg(:,1:id);
img2 = binImg(:,id+1:2*id);
img3 = binImg(:,2*id+1:columns);

%First part
black_portion = find(img1==0);
len_black = length(black_portion);
whole_image = find(img1==0|img1==1);
len_pixels = length(whole_image);
normArea1 = len_black/len_pixels;

%Second part
black_portion = find(img2==0);
len_black = length(black_portion);
whole_image = find(img2==0|img2==1);
len_pixels = length(whole_image);
normArea2 = len_black/len_pixels;


%Third part
black_portion = find(img3==0);
len_black = length(black_portion);
whole_image = find(img3==0|img3==1);
len_pixels = length(whole_image);
normArea3 = len_black/len_pixels;

% Six_Fold_Feature
% Cropping each image part
% Cropping vertical part 1 

[rows1, cols1] = find(img1==0);
TR1=min(rows1);
BR1=max(rows1);
ysize1=BR1-TR1;
TC1=min(cols1);
BC1=max(cols1);
xsize1=BC1-TC1;
CrImg1 = imcrop(img1,[TC1 TR1 xsize1 ysize1]);

% Size of rows and columns of CrImg1
[R1, C1] = size(CrImg1);

% Center of mass of CrImg1..
CrImg1 = imcrop(img1,[TC1 TR1 xsize1 ysize1]);

% Size of rows and columns of CrImg1

[CrRows1, CrCols1] = find(CrImg1==0);
Rcom1 = mean (CrRows1);
Ccom1 = mean (CrCols1);

% Area of top and bottom of cropped img1

TopArea1 = (Rcom1 - 1) *  C1;
BottomArea1 =  (R1 - Rcom1) * C1;


% Cropping vertical part 2 
[rows2, cols2] = find(img2 ==0);
TR2 =min(rows2);
BR2 =max(rows2);
ysize2=BR2-TR2;
TC2=min(cols2);
BC2=max(cols2);
xsize2=BC2-TC2;
CrImg2 = imcrop(img2,[TC2 TR2 xsize2 ysize2]);


% Size of rows and columns of CrImg2

[R2, C2] = size(CrImg2);

% Center of mass of CrImg2

[CrRows2, CrCols2] = find(CrImg2==0);
Rcom2 = mean (CrRows2);
Ccom2 = mean (CrCols2);

% Area of top and bottom of cropped img2

TopArea2 = (Rcom2 - 1) *  C2;
BottomArea2 =  (R2 - Rcom2) * C2;


% Cropping verticl part 3
[rows3, cols3] = find(img3==0);
TR3=min(rows3);
BR3=max(rows3);
ysize3=BR3-TR3;
TC3=min(cols3);
BC3=max(cols3);
xsize3=BC3-TC3;
CrImg3 = imcrop(img3,[TC3 TR3 xsize3 ysize3]);
imshow(CrImg3);
pause (2);

% Size of rows and columns of CrImg3

[R3, C3] = size(CrImg3);

% Center of mass of CrImg3

[CrRows3, CrCols3] = find(CrImg3==0);
Rcom3 = mean (CrRows3);
Ccom3 = mean (CrCols3);


% Area of top and bottom of cropped img3

TopArea3 = (Rcom3 - 1) *  C3;
BottomArea3 =  (R3 - Rcom3) * C3;


end