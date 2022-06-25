function [p11, p10, p4, p5, p9, p3, p12, p6,lmargin,rmargin] = DrawFiveRects(app)
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
    [orx,ory] = get4vertices(app);

    p11 = [orx(1)+lmargin ory(1)+tmargin];
    p10 = [orx(2)+lmargin ory(2)+tmargin];
    p4 = [orx(3)+lmargin ory(3)+tmargin];
    p5 = [orx(4)+lmargin ory(4)+tmargin];

    wallPoints = [p9;p3;p12;p6];
    verticesPoints = [p11;p10;p4;p5];

    plot(verticesPoints(:,1),verticesPoints(:,2), 'r*','MarkerSize',15);
    
    plot(wallPoints(:,1),wallPoints(:,2),'g*','MarkerSize',15)



    % return points corrdinates by defining the topleft of origin image as 0,0
    

    p9 = [p9(1)-lmargin p9(2)-tmargin];
    p3 = [p3(1)-lmargin p3(2)-tmargin];
    p12 =[p12(1)-lmargin p12(2)-tmargin];
    p6 = [p6(1)-lmargin p6(2)-tmargin];

    p11 = [p11(1)-lmargin p11(2)-tmargin];
    p10 = [p10(1)-lmargin p10(2)-tmargin];
    p4 = [p4(1)-lmargin p4(2)-tmargin];
    p5 = [p5(1)-lmargin p5(2)-tmargin];


    hold off;
end
 


