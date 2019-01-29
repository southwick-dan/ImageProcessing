%% Image Processing HW2
%% 1a
walk = imread('walk.png');
walk = im2double(walk);
walk1 = filter2([-1 0 1; -2 0 2; -1 0 1], walk);
imshow(walk1,[]);
%% 1b
walk2 = abs(255*walk1) > 200;
imshow(walk2,[]);
%% 1c
walk3 = filter2([-1 -2 1; 0 0 0; 1 2 1], walk);
imshow(walk3,[]);
walk4 = abs(255*walk3) > 200;
imshow(walk4,[]);
%% 2a
cat = imread('fuzzycat.png');
cat1 = imfilter(cat, ones(5)/25);
figure
imshow(cat1,[]);
%% 2b
cat2 = cat + (cat - cat1);
imshow(cat2,[]);
cat3 = cat + 2*(cat - cat1);
imshow(cat3,[]);
cat4 = cat + 3*(cat - cat1);
imshow(cat4,[]);
cat5 = cat + 4*(cat - cat1);
imshow(cat5,[]);
cat6 = cat + 5*(cat - cat1);
imshow(cat6,[]);
%% 3a
boat = imread('boat.png');
boat1 = imfilter(boat, ones(5)/25);
imshow(boat1,[]);
%% 3b
boat2 = medfilt2(boat1,[5 5])
imshow(boat2,[]);
%% 5a
board = imread('board.png')
h=fspecial('gaussian',[19 19],3) 
board2 = imfilter(board,h);
imshow(board2,[]);
%% 5c
board3 = imfilter(board,gaussv(19,3));
imshow(board3,[]);
%% 5d
board4 = imfilter(board,gaussv(31,5));
imshow(board4,[]);
%% 5e
board5 = imfilter(board,gaussv(75,5));
imshow(board5,[]);
