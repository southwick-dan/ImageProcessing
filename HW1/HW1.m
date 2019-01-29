%% Image Processing HW1
%% 1a
im1 = ones(500)*60;
imshow(im1,[0 255]);
%% 1b
im2=repmat([0,0,255,255],500,125);
imshow(im2,[0,255]);
%% 1c
im3l=ones(1,500)'*32*ones(1,250);
im3r=ones(1,500)'*200*ones(1,250);
im3 =horzcat(im3l,im3r);
imshow(im3,[0,255]);
%% 1d
im4=[0:0.5:249.5]'*ones(1,500);
imshow(uint8(im4),[0,255]);
%% 1e
[y,x] = meshgrid(0:499,0:499);
I = 255*exp(-(((x-64).^2+(y-64).^2)/(200.^2)));
imshow(uint8(I),[0,255]);
%% 1f
imc = zeros(500,500,3);
imc(:,1:250,1)=1;
imc(1:250,:,2)=1;
imc(:,:,3)=1;
imshow(imc);
%% 3
I128 = round(I/2);
imshow(I128,[0,127]);
I64 = round(I128/2);
imshow(I64,[0,63]);
I32 = round(I64/2);
imshow(I32,[0,31]);
I16 = round(I32/2);
imshow(I16,[0,15]);





