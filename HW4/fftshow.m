function fftshow(im)
figure
imshow(fftshift(log(abs(fft2(im)))),[]);
end