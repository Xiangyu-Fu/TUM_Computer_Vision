function [p9, p3, p12, p6] = DrawFiveRects(app)
    [bim,bim_alpha,vx,vy,ceilrx,ceilry,floorrx,floorry,...
    leftrx,leftry,rightrx,rightry,backrx,backry,lmargin,rmargin,tmargin,bmargin] = ...
    TIP_get5rects(app);

    % display the expended image
    figure(1);
    imshow(bim);
    % Here is one way to use the alpha channel (works for 3D plots too!)
    %%alpha(bim_alpha);
    
    % Draw the Vanishing Point and the 4 faces on the image
    figure(1);
    hold on;
    plot(vx,vy,'w*');
    plot([ceilrx ceilrx(1)], [ceilry ceilry(1)], 'y-');
    plot([floorrx floorrx(1)], [floorry floorry(1)], 'm-');
    plot([leftrx leftrx(1)], [leftry leftry(1)], 'c-');
    plot([rightrx rightrx(1)], [rightry rightry(1)], 'g-');
    hold off;

    p9 = [leftrx(1) leftry(1)];
    p3 = [leftrx(4) leftry(4)];
    p12 =[rightrx(2) rightry(2)];
    p6 = [rightrx(3) rightry(3)];

    if (lmargin > 0)

        p12(1) = round(find_line_x(vx,vy,rightrx(2),rightry(2), tmargin));
        p12(2) =  tmargin;
    
        p6(1) = round(find_line_x(vx,vy,rightrx(3),rightry(3), max(floorry)));
        p6(2) =   max(floorry);

    elseif (rmargin > 0)

        p9(1) = round(find_line_x(vx,vy,leftrx(1),leftry(1), tmargin));
        p9(2) =  tmargin;
    
        p3(1) = round(find_line_x(vx,vy,leftrx(4),leftry(4), max(floorry)));
        p3(2) =   max(floorry);

    end


end
 


