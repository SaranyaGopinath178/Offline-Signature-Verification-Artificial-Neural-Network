function [horizontal_hist, vertical_hist] = feature_horizontalVerticalHistogram(binaryCroppedImage)

row_sums = sum(~binaryCroppedImage, 2);
[~,horizontal_hist] =  max(row_sums);

column_sums = sum(~binaryCroppedImage, 1);
[~,vertical_hist] =  max(column_sums);

end