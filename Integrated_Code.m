
d = dir('D:\Applications\MATLAB\R2013a\toolbox\images\sign');
isub = [d(:).isdir];
nameFolds = {d(isub).name}';
nameFolds(ismember(nameFolds,{'.','..'})) = [];
n=size(nameFolds);
ft_vector = zeros(50,50);

for j = 1 : n(1,1)
    m = ['D:\Applications\MATLAB\R2013a\toolbox\images\sign' '\' char(nameFolds(j,1))];
    
    dirlist = dir(m);
    cnt =1;
    
    for i = 3:length(dirlist)
        
        dirlist(i)
        I = imread([m '\' dirlist(i).name]);
        %imshow(I)
        pause(1);
        R = imresize(I,[256 256]);
        B = im2bw(R,0.5);
        BW = bwmorph(B,'fill');
        G = imclearborder(B);
        [rows, cols] = find(BW == 0);
        topRow = min(rows(:));
        bottomRow = max(rows(:));
        leftCol = min(cols(:));
        rightCol = max(cols(:));
        croppedImage = G(topRow:bottomRow,leftCol:rightCol);
        
        originalCropped = R(topRow:bottomRow,leftCol:rightCol);
        %imshow(originalCropped);
        %pause(1);
        binImg = im2bw(originalCropped);
        [horizontal_hist, vertical_hist] = feature_horizontalVerticalHistogram(binImg);
        
        ft_vector(i-2,1) = horizontal_hist;
        ft_vector(i-2,2) = vertical_hist;
        
        Norm_area =  feature_normalizedArea(croppedImage);
        ft_vector(i-2,3) = Norm_area;
        
        aspect_Ratio = feature_aspectRatio(croppedImage);
        ft_vector(i-2,4) = aspect_Ratio;
        
        [centerOfMass1, centerOfMass2] = feature_centerOfMass(originalCropped);
        ft_vector(i-2,5) = min(centerOfMass1);
        ft_vector(i-2,6) = max(centerOfMass1);
        ft_vector(i-2,7) = min(centerOfMass2);
        ft_vector(i-2,8) = max(centerOfMass2);
                
%         disp(['Horizontal Histogram :',num2str(horizontal_hist)]);
%         disp(['Vertical Histogram :',num2str(vertical_hist)]);
%         disp(['Normalized area :',num2str(Norm_area)]);
%         disp(['Aspect Ratio :',num2str(aspect_Ratio)]);
%         disp(['Center of Mass for first half of image :',num2str(centerOfMass1)]);
%         disp(['Center of Mass for second half of image :',num2str(centerOfMass2)]);
   
        
        normVector = NormalizeFeatureVector(ft_vector(i-2,:));
        disp(['Normalize Vector :',num2str(normVector)]);
        
    end
    
    
    
end