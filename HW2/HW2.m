%% Image Processing HW2
%% 1a
im1a=ones(1,500)'*0*ones(1,125);
im1b=ones(1,500)'*128*ones(1,125);
im1c=ones(1,500)'*255*ones(1,250);
im1 =horzcat(im1a,im1b,im1c);
imshow(im1,[0,255]);
%% 1b
im2a=ones(1,125)'*0*ones(1,500);
im2b=ones(1,125)'*128*ones(1,500);
im2c=ones(1,250)'*255*ones(1,500);
im2 =vertcat(im2a,im2b,im2c);
imshow(im2,[0,255]);
%% 1c
im3 = zeros(500,500);
im3(:,1:250)=128;
im3(1:250,:)=255;
imshow(im3,[0,255]);
%% 1d
im4 = zeros(500,500);
im4(1:250,:)=128;
im4(:,1:250)=255;
imshow(im4,[0,255]);
%% 4a
im4 = imread('mystery2.png');
out = histeq(im4);
imshow(out);
%% 4b
bs = @(block_struct) histeq(block_struct.data);
out2 = blockproc(im4, [80 80], bs);
imshow(out2);
