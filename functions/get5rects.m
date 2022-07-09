
% Given the 5 user-speficied points, this function expands the image to
% make sure that each "face" of the box is a proper rectangle.  It returns
% the 5 faces of the box (ceiling,floor,left,right and back). They are
% encoded clockwise (upper-left, upper-right, lower-right,lower-left).
% The new (bigger) image and its alhpa mask as well as the new 
% vanishing point (vx,vy) are also returned.
function [big_im,vx,vy,lmargin,rmargin,tmargin,bmargin] = get5rects(app)
    
    im = app.image_BG;
    vx = app.VanishingPoint(1);
    vy = app.VanishingPoint(2);
    irx = app.irx;
    iry = app.iry;
    
    
    
    % find where the line from VP thru inner rectangle hits the edge of image
    [ox,oy] = find_corner(vx,vy,irx(1),iry(1),0,0);
    orx(1) = ox;  ory(1) = oy;
    [ox,oy] = find_corner(vx,vy,irx(2),iry(2),app.x_limit,0);
    orx(2) = ox;  ory(2) = oy;
    [ox,oy] = find_corner(vx,vy,irx(3),iry(3),app.x_limit,app.y_limit);
    orx(3) = ox;  ory(3) = oy;
    [ox,oy] = find_corner(vx,vy,irx(4),iry(4),0,app.y_limit);
    orx(4) = ox;  ory(4) = oy;
    orx = round(orx);
    ory = round(ory);
    
    
    % expand the image so that each "face" of the box is a proper rectangle
    [ymax,xmax,cdepth] = size(im);
    lmargin = -min(orx);
    rmargin = max(orx) - xmax;
    tmargin = -min(ory);
    bmargin = max(ory) - ymax;
    big_im = zeros([ymax+tmargin+bmargin xmax+lmargin+rmargin cdepth]);
    big_im_alpha = zeros([size(big_im,1) size(big_im,2)]);
    big_im(tmargin+1:end-bmargin,lmargin+1:end-rmargin,:) = im2double(im);
    big_im_alpha(tmargin+1:end-bmargin,lmargin+1:end-rmargin) = 1;
    
    app.bim = big_im;
    
    app.lmargin = lmargin;
    app.rmargin = rmargin;
    app.tmargin = tmargin;
    app.bmargin = bmargin;
    
    
    % update all variables for the new image
    vx = vx + lmargin;
    vy = vy + tmargin;
    irx = irx + lmargin;
    iry = iry + tmargin;
    orx = orx + lmargin;
    ory = ory + tmargin;
    
    
    %%%%%%%%%%%% define the 5 rectangles
    
    % ceiling 
    ceilrx = [orx(1) orx(2) irx(2) irx(1)];
    ceilry = [ory(1) ory(2) iry(2) iry(1)];
    if (ceilry(1) < ceilry(2)),
         ceilrx(1) = round(find_line_x(vx,vy,ceilrx(1),ceilry(1),ceilry(2)));
         ceilry(1) = ceilry(2);
    else
         ceilrx(2) = round(find_line_x(vx,vy,ceilrx(2),ceilry(2),ceilry(1)));
         ceilry(2) = ceilry(1);
    end
    
    % floor
    floorrx = [irx(4) irx(3) orx(3) orx(4)];
    floorry = [iry(4) iry(3) ory(3) ory(4)];
    if (floorry(3) > floorry(4))
         floorrx(3) = round(find_line_x(vx,vy,floorrx(3),floorry(3),floorry(4)));
         floorry(3) = floorry(4);
    else
         floorrx(4) = round(find_line_x(vx,vy,floorrx(4),floorry(4),floorry(3)));
         floorry(4) = floorry(3);
    end
    
    % left
    leftrx = [orx(1) irx(1) irx(4) orx(4)];
    leftry = [ory(1) iry(1) iry(4) ory(4)];
    if (leftrx(1) < leftrx(4))
         leftry(1) = round(find_line_y(vx,vy,leftrx(1),leftry(1),leftrx(4)));
         leftrx(1) = leftrx(4);
    else
         leftry(4) = round(find_line_y(vx,vy,leftrx(4),leftry(4),leftrx(1)));
         leftrx(4) = leftrx(1);
    end
    
    %%% Fix leftwall error begins
    
    
    if (lmargin > 0)
    
        leftry(1) = round(find_line_y(vx,vy,leftrx(1),leftry(1),lmargin));
        leftrx(1) = lmargin;
        
        leftry(4) = round(find_line_y(vx,vy,leftrx(4),leftry(4),lmargin));
        leftrx(4) = lmargin;
    
    end
    %%% Fix leftwall error ends
    
    
    
    % right
    
    rightrx = [irx(2) orx(2) orx(3) irx(3)];
    rightry = [iry(2) ory(2) ory(3) iry(3)];
    if (rightrx(2) > rightrx(3))
         rightry(2) = round(find_line_y(vx,vy,rightrx(2),rightry(2),rightrx(3)));
         rightrx(2) = rightrx(3);
    else
         rightry(3) = round(find_line_y(vx,vy,rightrx(3),rightry(3),rightrx(2)));
         rightrx(3) = rightrx(2);
    end
    
    %%% fix rightwall error begins
    
    if( rmargin>0 )
        rightry(2) = round(find_line_y(vx,vy,rightrx(2),rightry(2), max(orx) -rmargin));
        rightrx(2) = max(orx) - rmargin;
        
        rightry(3) = round(find_line_y(vx,vy,rightrx(3),rightry(3), max(orx) -rmargin));
        rightrx(3) = max(orx) - rmargin;
    
    end
    
    %%% fix rightwall error ends

end
