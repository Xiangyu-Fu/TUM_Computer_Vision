function [p11, p10, p4, p5, p9, p3, p12, p6,lmargin,rmargin,tmargin,bmargin,height, width] = DrawFiveRects(app)
    
    [bim,bim_alpha,vx,vy,ceilrx,ceilry,floorrx,floorry,...
    leftrx,leftry,rightrx,rightry,backrx,backry,lmargin,rmargin,tmargin,bmargin] = ...
    get5rects(app);

    [orx,ory] = get4vertices(app);

    [height, width, channel] = size(bim);

    app.RealWall(1,:) = [app.RealWall(1,1) + lmargin, app.RealWall(1,2) + tmargin];
    app.RealWall(2,:) = [app.RealWall(2,1) + lmargin, app.RealWall(2,2) + tmargin];
    app.RealWall(3,:) = [app.RealWall(3,1) + lmargin, app.RealWall(3,2) + tmargin];
    app.RealWall(4,:) = [app.RealWall(4,1) + lmargin, app.RealWall(4,2) + tmargin];
    app.VanishingPoint = [app.VanishingPoint(1) + lmargin, app.VanishingPoint(2) + tmargin];
    app.expandImage = bim;


    p10(2) = tmargin;
    p10(1) = round(find_line_x(vx,vy,app.RealWall(2,1),app.RealWall(2,2), p10(2) ));

    p12(1) = width - rmargin;
    p12(2) = round(find_line_y(vx,vy,app.RealWall(2,1),app.RealWall(2,2), p12(1) ));

    p6(1) = width - rmargin;
    p6(2) = round(find_line_y(vx,vy,app.RealWall(4,1),app.RealWall(4,2), p6(1) ));

    p4(2) = height - bmargin;
    p4(1) = round(find_line_x(vx,vy,app.RealWall(4,1),app.RealWall(4,2), p4(2) ));

    p9(2) = tmargin;
    p9(1) = round(find_line_x(vx,vy,app.RealWall(1,1),app.RealWall(1,2), p9(2) ));

    p3(2) = height - bmargin;
    p3(1) = round(find_line_x(vx,vy,app.RealWall(3,1),app.RealWall(3,2), p3(2) ));

    p11(1) = lmargin;
    p11(2) = round(find_line_y(vx,vy,app.RealWall(1,1),app.RealWall(1,2), p11(1) ));

    p5(1) = lmargin;
    p5(2) = round(find_line_y(vx,vy,app.RealWall(3,1),app.RealWall(3,2), p5(1) ));



    top_bottomPoints = [p9;p10;p3;p4];
    left_rightPoints = [p11;p12;p5;p6];

%     %%% for test
    figure(1);
    
    imshow(bim);

    hold on;
    plot(vx,vy,'w*');
    plot([ceilrx ceilrx(1)], [ceilry ceilry(1)], 'y-');
    plot([floorrx floorrx(1)], [floorry floorry(1)], 'm-');
    plot([leftrx leftrx(1)], [leftry leftry(1)], 'c-');
    plot([rightrx rightrx(1)], [rightry rightry(1)], 'g-');

    plot(top_bottomPoints(:,1),top_bottomPoints(:,2), 'r*','MarkerSize',15);
    plot(left_rightPoints(:,1),left_rightPoints(:,2),'g*','MarkerSize',15);

    hold off;

    %%% test ends

end
 


