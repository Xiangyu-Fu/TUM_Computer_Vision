I = imread('simple-room.png');

img = im2double(I);

    leftBorder = zeros(size(img, 1), 0, 3);
    rightBorder = zeros(size(img, 1), 0, 3);

    imgWithBorder = [leftBorder, img, rightBorder];

    topBorder = zeros(30, size(imgWithBorder,2), 3);
    bottomBorder = zeros(30, size(imgWithBorder,2), 3);

    imgWithBorder = [topBorder; imgWithBorder; bottomBorder];

    imshow(imgWithBorder)