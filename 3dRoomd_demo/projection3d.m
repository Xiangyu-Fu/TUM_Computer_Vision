clear;
close all;
clc;

img_front = imread('front.png');    
img_left = imread('left.png');     
img_right = imread('right.png');     
img_up = imread('up.png');     
img_down = imread('down.png');   

xImage_f = [0 1; 0 1];   % The x data for the image corners
yImage_f = [0 0; 0 0];             % The y data for the image corners
zImage_f = [1 1; 0 0];   % The z data for the image corners
surf(xImage_f,yImage_f,zImage_f,...    % Plot the surface
     'CData',img_front,...
     'FaceColor','texturemap');

xlim([-0.5 1.5])
ylim([-0.5 1.5])
zlim([-0.5 1.5])

hold on

xImage_l = [0 0; 0 0];   % The x data for the image corners
yImage_l = [-1 0; -1 0];             % The y data for the image corners
zImage_l = [1 1; 0 0];   % The z data for the image corners
surf(xImage_l,yImage_l,zImage_l,...    % Plot the surface
     'CData',img_left,...
     'FaceColor','texturemap');
xImage_r = [1 1; 1 1];   % The x data for the image corners
yImage_r = [0 -1; 0 -1];             % The y data for the image corners
zImage_r = [1 1; 0 0];   % The z data for the image corners
surf(xImage_r,yImage_r,zImage_r,...    % Plot the surface
     'CData',img_right,...
     'FaceColor','texturemap');

xImage_u = [0 1; 0 1];   % The x data for the image corners
yImage_u = [-1 -1; 0 0];             % The y data for the image corners
zImage_u = [1 1; 1 1];   % The z data for the image corners
surf(xImage_u,yImage_u,zImage_u,...    % Plot the surface
     'CData',img_up,...
     'FaceColor','texturemap');


xImage_d = [0 1; 0 1];   % The x data for the image corners
yImage_d = [0 0; -1 -1];             % The y data for the image corners
zImage_d= [0 0; 0 0];   % The z data for the image corners
surf(xImage_d,yImage_d,zImage_d,...    % Plot the surface
     'CData',img_down,...
     'FaceColor','texturemap');



%campos and camtarget need to be configured
campos([0.5 -1 0.5])
camtarget([10 100 100])

set(gca,'Projection','perspective')

hold off

% 
% xlim([-1.5 1.5])
% ylim([-1.5 1.5])
% zlim([-1.5 1.5])

xlabel('x');
ylabel('y');
zlabel('z');








