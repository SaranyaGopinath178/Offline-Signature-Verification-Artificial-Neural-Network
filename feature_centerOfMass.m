
function [centerOfMass1,centerOfMass2] = feature_centerOfMass(originalCropped)

[r, c, numberOfColorChannels] = size(originalCropped);
if numberOfColorChannels > 1
  Igray = rgb2gray(originalCropped);
else
  Igray = originalCropped; % It's already gray.
end      

rgbImg = (Igray);
[~, cols] = size(rgbImg);
id=fix(cols/2);
img1 = rgbImg(:, 1:id);
img2 = rgbImg(:,id+1 : cols);


binaryImage1=true(size(img1));
labeledImage=logical(binaryImage1);
measurments=regionprops(labeledImage,img1,'WeightedCentroid');
centerOfMass1=measurments.WeightedCentroid;


binaryImage2=true(size(img2));
labeledImage2=logical(binaryImage2);
measurments=regionprops(labeledImage2,img2,'WeightedCentroid');
centerOfMass2=measurments.WeightedCentroid;

% 
% allCentroids = centerOfMass1;
% centroidsX = allCentroids(1:2:end-1);
% centroidsY = allCentroids(2:2:end);
% 
% allCentroids = centerOfMass2;
% centroidsX2 = allCentroids(1:2:end-1);
% centroidsY2 = allCentroids(2:2:end);

end