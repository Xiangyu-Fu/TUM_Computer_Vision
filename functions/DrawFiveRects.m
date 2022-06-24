function DrawFiveRects(app)
    [bim,bim_alpha,vx,vy,ceilrx,ceilry,floorrx,floorry,...
    leftrx,leftry,rightrx,rightry,backrx,backry] = ...
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
end