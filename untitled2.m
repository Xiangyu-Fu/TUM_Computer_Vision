xp = imread('oil-painting.png');

fig = uifigure;
ax = uiaxes(fig);
imshow(xp, 'Parent', ax)
% fig.HandleVisibility = 'on';
% result = ginput(4);
% [x,y] = getpts(ax);
% imshow(xp);
drawnow
h = drawpoint(ax)
% x=round(x);
% y=round(y);
ax.YLim = [0 size(xp,1)];
ax.XLim = [0 size(xp,2)];
% h = drawrectangle(ax);
% [x,y]
drawnow
j = drawpoint(ax)
k = drawpoint(ax)