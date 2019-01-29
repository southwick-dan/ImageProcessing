function myjpeg (im, tau)
im = double(im);
im = im - 128;
fun = @(block_struct)...
    mydct(block_struct.data,tau);   
imb = blockproc(im,[8 8],fun);
imout = imb + 128;
imout = max(min(imout,255),0);
figure;
imshow(imout,[0 255]);
end
