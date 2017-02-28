function Norm_area = feature_normalizedArea(croppedImage)

total_black_idx = find(croppedImage==0);
no_of_black = length(total_black_idx);
total_idx = find(croppedImage==0|croppedImage==1);
no_of_pix = length(total_idx);
Norm_area = no_of_black/no_of_pix;

end