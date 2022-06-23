xp = imread('oil-painting.png');

fig = uifigure;
ax = uiaxes(fig);
imshow(xp, 'Parent', ax)
% fig.HandleVisibility = 'on';
% result = ginput(4);
% [x,y] = getpts(ax);
% imshow(xp);
% h = drawpoint
% x=round(x);
% y=round(y);
ax.YLim = [0 size(xp,1)];
ax.XLim = [0 size(xp,2)];
h = drawrectangle(ax);
% [x,y]
% fig.HandleVisibility = 'off';
