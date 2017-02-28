function aspectRatio = feature_aspectRatio(croppedImage)

width = size(croppedImage,1);
height = size(croppedImage,2);
aspectRatio = height/width;


end