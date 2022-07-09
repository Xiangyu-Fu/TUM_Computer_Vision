clc; clear all;

a = [1 2; 3 4; 5 6];

k = cell(3, 2);
for k = 1:3
    eval(['p',num2str(k),'=a(k, :);']);
end


% img = imread('dataset/simple-room.png');
% imshow(img)
% % [x, y] = ginput(2);
% % get each layer of iamge
% img_r = img(:,:,1);
% img_g = img(:,:,2);
% img_b = img(:,:,3);
% img_size = size(img);
% img_mask = zeros(img_size(1), img_size(2));
% 
% pos = [[300 550];
% [420 600]];
% img_mask(pos(2,1):pos(2,2), pos(1,1):pos(1,2)) = 1;
% img_full = inpaintExemplar(img, logical(img_mask));
% 
% imshow(img_full);