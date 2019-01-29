function mysuperpix( im, k )
[L, N] = superpixels(im, k);
figure
BW =boundarymask(L);
imshow(imoverlay(im,BW,'cyan'),'InitialMagnification',67);

outputImage = zeros(size(im),'like',im);
idx = label2idx(L);
numRows = size(im,1);
numCols = size(im,2);
for labelVal = 1:N
    redIdx = idx{labelVal};
    greenIdx = idx{labelVal}+numRows*numCols;
    blueIdx = idx{labelVal}+2*numRows*numCols;
    outputImage(redIdx) = mean(im(redIdx));
    outputImage(greenIdx) = mean(im(greenIdx));
    outputImage(blueIdx) = mean(im(blueIdx));
end    
figure
imshow(outputImage,'InitialMagnification',67)
end

