function imfilt = boxfilt(im,w,h)
[a,b] = size(im);
filter = zeros(a,b);
filter(((a-h)/2+1):((a+h)/2),((b-w)/2+1):((b+w)/2))=ones(h,w);
imfilt = fftshift(filter);
end
