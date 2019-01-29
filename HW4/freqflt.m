function imfilt = freqflt(im, filt)
mult = fft2(im) .* (filt);
imfilt = real(ifft2(mult));
end
