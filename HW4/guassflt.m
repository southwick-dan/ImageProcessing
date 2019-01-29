function imfilt = guassflt(im, filt)
[a,b] = size(im);
[x,y] = meshgrid(1:b,1:a);
imfilt = exp(-0.5*sum([x(:)-(b+1)/2 y(:)-(a+1)/2].^2 *inv(filt),2));
imfilt = reshape(imfilt, [a b]);
maxi = max(imfilt(:));
imfilt = fftshift(imfilt/maxi);
end