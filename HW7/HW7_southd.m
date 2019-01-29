%% 1a
hotsauce = imread('hotsauce.png');
letter = imread('letter.png');
C = normxcorr2(letter,hotsauce);
imshow(C);
colormap jet;
%% 1b
[ypeak, xpeak] = find(C > 0.9);
yoffSet = ypeak-size(letter,1);
xoffSet = xpeak-size(letter,2);
imshow(hotsauce);
for i = 1:size(ypeak,1)
    rectangle('Position', [xoffSet(i)+1, yoffSet(i)+1, size(letter,2), size(letter,1)], 'EdgeColor', 'yellow');
end
%% 1c
[ypeak, xpeak] = find(C > 0.8);
yoffSet = ypeak-size(letter,1);
xoffSet = xpeak-size(letter,2);
imshow(hotsauce);
for i = 1:size(ypeak,1)
    rectangle('Position', [xoffSet(i)+1, yoffSet(i)+1, size(letter,2), size(letter,1)], 'EdgeColor', 'yellow');
end
%% 1d
[ypeak, xpeak] = find(C > 0.7);
yoffSet = ypeak-size(letter,1);
xoffSet = xpeak-size(letter,2);
imshow(hotsauce);
for i = 1:size(ypeak,1)
    rectangle('Position', [xoffSet(i)+1, yoffSet(i)+1, size(letter,2), size(letter,1)], 'EdgeColor', 'yellow');
end
%% 2a
Liq1 = rgb2gray(imread('Liq1.jpg'));
Liq2 = rgb2gray(imread('Liq2.jpg'));
corners1 = detectHarrisFeatures(Liq1);
corners2 = detectHarrisFeatures(Liq2);
[features1,valid_points1] = extractFeatures(Liq1,corners1);
[features2,valid_points2] = extractFeatures(Liq2,corners2);
indexPairs = matchFeatures(features1,features2);
matchedPoints1 = valid_points1(indexPairs(:,1),:);
matchedPoints2 = valid_points2(indexPairs(:,2),:);
showMatchedFeatures(Liq1,Liq2,matchedPoints1,matchedPoints2);
%% 2b
Liq1 = rgb2gray(imread('Liq1.jpg'));
Liq2 = rgb2gray(imread('Liq3.jpg'));
corners1 = detectHarrisFeatures(Liq1);
corners2 = detectHarrisFeatures(Liq2);
[features1,valid_points1] = extractFeatures(Liq1,corners1);
[features2,valid_points2] = extractFeatures(Liq2,corners2);
indexPairs = matchFeatures(features1,features2);
matchedPoints1 = valid_points1(indexPairs(:,1),:);
matchedPoints2 = valid_points2(indexPairs(:,2),:);
showMatchedFeatures(Liq1,Liq2,matchedPoints1,matchedPoints2);
%% 2c
Liq1 = rgb2gray(imread('Liq1.jpg'));
Liq2 = rgb2gray(imread('Liq3.jpg'));
corners1 = detectSURFFeatures(Liq1);
corners2 = detectSURFFeatures(Liq2);
[features1,valid_points1] = extractFeatures(Liq1,corners1);
[features2,valid_points2] = extractFeatures(Liq2,corners2);
indexPairs = matchFeatures(features1,features2);
matchedPoints1 = valid_points1(indexPairs(:,1),:);
matchedPoints2 = valid_points2(indexPairs(:,2),:);
showMatchedFeatures(Liq1,Liq2,matchedPoints1,matchedPoints2);
%% 4
noise = imread('noise.png');
stripes = imread('stripes.png');
cells = imread('cells.png');
[En1,En2,En3,En4,En5] =  my_entropy_value(noise);
[Es1,Es2,Es3,Es4,Es5] =  my_entropy_value(stripes);
[Ec1,Ec2,Ec3,Ec4,Ec5] =  my_entropy_value(cells);

