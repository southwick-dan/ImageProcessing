%% Image Processing HW4
%% 1a
market = double(imread('market.png'));
x = 205 ; y = 696;
gx = market(x+1,y) - market(x,y);
gy = market(x,y+1) - market(x,y);
mag = sqrt((gx)^2+(gy)^2);
alp = atand(gy/gx);
%% 1b
k = [-1 -2 -1; 0 0 0; 1 2 1]/8;
gx2 = imfilter(market, k);
gy2 = imfilter(market, k');
gx2b = gx2(x,y);
gy2b = gy2(x,y);
mag2 = sqrt(gx2b^2 + gy2b^2);
alp2 = atand(gy2b/gx2b);
%% 2a
magsob = sqrt(gx2.^2+gy2.^2);
angsob = atand(gy2./gx2);
imshow(magsob>50,[]);
%% 2b
imshow(abs(angsob-45) < 20,[]);
%% 2c
imshow(((magsob>50)&(abs(angsob-45) < 20)),[]);
%% 3a
deck = double(imread('deck.png'));
BW = edge(deck,'Canny');
imshow(BW);
%% 3b
[H,theta,rho] = hough(BW);
peaks = houghpeaks(H,20);
lines = houghlines(BW,theta,rho,peaks);
figure, imshow('deck.png'), hold on
max_len2 = 0;
for k = 1:length(lines)
   xy2 = [lines(k).point1; lines(k).point2];
   plot(xy2(:,1),xy2(:,2),'LineWidth',2,'Color','green');

   % Plot beginnings and ends of lines
   plot(xy2(1,1),xy2(1,2),'x','LineWidth',2,'Color','yellow');
   plot(xy2(2,1),xy2(2,2),'x','LineWidth',2,'Color','red');

   % Determine the endpoints of the longest line segment
   len2 = norm(lines(k).point1 - lines(k).point2);
   if ( len2 > max_len2)
      max_len2 = len2;
      xy_long = xy2;
   end
end
%% 3d
BW2 = edge(deck,'Sobel');
[H2,theta2,rho2] = hough(BW2);
peaks2 = houghpeaks(H2,25);
lines2 = houghlines(BW2,theta2,rho2,peaks2);
figure, imshow('deck.png'), hold on
max_len2 = 0;
for k2 = 1:length(lines2)
   xy2 = [lines2(k2).point1; lines2(k2).point2];
   plot(xy2(:,1),xy2(:,2),'LineWidth',2,'Color','green');

   % Plot beginnings and ends of lines
   plot(xy2(1,1),xy2(1,2),'x','LineWidth',2,'Color','yellow');
   plot(xy2(2,1),xy2(2,2),'x','LineWidth',2,'Color','red');

   % Determine the endpoints of the longest line segment
   len2 = norm(lines2(k2).point1 - lines2(k2).point2);
   if ( len2 > max_len2)
      max_len2 = len2;
      xy_long = xy2;
   end
end
%% 4
curling = imread('curling.jpg');
curling = curling(:,:,3);
imshow(curling);
[centers, radii] = imfindcircles(curling,[13 350],'ObjectPolarity','dark');
viscircles(centers, radii,'EdgeColor','b');
%% 5
important = imread('important.png');
important = important>180;
imshow(important,[]);
Ilabel = bwlabel(important,8);
stat = regionprops(Ilabel,'Area');
area=[stat.Area];
[stat_area,stat_index]=max(area);
important2 = ismember(Ilabel,stat_index);
figure
imshow(important2);
%% 6
page = imread('page.png');
level = graythresh(page);
BW6 = imbinarize(page,level);
imshow(BW6);
fun = @(block_struct)...
block_struct.data<mean2(block_struct.data)-2*std2(block_struct.data);
page2 = blockproc(page,[60 60],fun);
imshow(page2,[]);
