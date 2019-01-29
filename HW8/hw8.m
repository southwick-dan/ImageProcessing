%% 1
guardian = imread('guardian.png');
myjpeg(guardian,75);
%% 2a
PSF = fspecial('motion',21,11);
death = imread('death.png');
death1 = imfilter(death,PSF,255);
imshow(death1);
%% 2b,c
museum = imread('museum-blur.png');
museum1 = deconvwnr(museum,PSF,0.00001);
figure
imshow(museum1);
%% 3a
iptsetpref('ImshowAxesVisible','on')
clock2 = double(imread('clock2.png'));
theta = 0:179; %theta = 0:179;
[R,xp] = radon(clock2,theta);
imshow(R,[ ],'Xdata',theta,'Ydata',xp,'InitialMagnification','fit')
xlabel('\theta (degrees)')
ylabel('x''')
colormap('gray'), colorbar
iptsetpref('ImshowAxesVisible','off')
%% 3b   
I1 = uint8(iradon(R,0:179));
imshow(I1,[]);
%% 4a
guys = double(imread('guys.png'));
imshow(guys>128);
%% 4b
noise = (rand(size(guys))-0.5)*100;
imshow((guys+noise)>128);
%% 4c
bmask = [1 9 3 11; 13 5 15 7; 4 12 2 10; 16 8 14 6]*16;
[m,n] = size(guys);
m1 = floor(m/4);
n1 = floor(n)/4;
hmask = repmat(bmask,[m1,n1]);
guys1 = guys(1:(m1*4),1:(n1*4));
guys2 = double(guys1) + hmask;
imshow(guys2>256);
%% 4d
imshow(dither(uint8(guys)));