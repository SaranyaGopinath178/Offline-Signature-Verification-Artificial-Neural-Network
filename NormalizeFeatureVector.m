
function [normalizedVector] = NormalizeFeatureVector(d)
    
    normalizedVector = (d-min(d(:)))/(max(d(:))-min(d(:)));

end
