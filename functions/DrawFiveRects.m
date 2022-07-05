function [p11, p10, p4, p5, p9, p3, p12, p6] = DrawFiveRects(app)
    
    [bim,vx,vy,lmargin,rmargin,tmargin,bmargin] = get5rects(app);


    [height, width, ~] = size(bim);

    app.RearWall(1,:) = [app.RearWall(1,1) + lmargin, app.RearWall(1,2) + tmargin];
    app.RearWall(2,:) = [app.RearWall(2,1) + lmargin, app.RearWall(2,2) + tmargin];
    app.RearWall(3,:) = [app.RearWall(3,1) + lmargin, app.RearWall(3,2) + tmargin];
    app.RearWall(4,:) = [app.RearWall(4,1) + lmargin, app.RearWall(4,2) + tmargin];
    app.VanishingPoint = [app.VanishingPoint(1) + lmargin, app.VanishingPoint(2) + tmargin];
    app.expandImage = bim;


    p10(2) = tmargin;
    p10(1) = round(find_line_x(vx,vy,app.RearWall(2,1),app.RearWall(2,2), p10(2) ));

    p12(1) = width - rmargin;
    p12(2) = round(find_line_y(vx,vy,app.RearWall(2,1),app.RearWall(2,2), p12(1) ));

    p6(1) = width - rmargin;
    p6(2) = round(find_line_y(vx,vy,app.RearWall(4,1),app.RearWall(4,2), p6(1) ));

    p4(2) = height - bmargin;
    p4(1) = round(find_line_x(vx,vy,app.RearWall(4,1),app.RearWall(4,2), p4(2) ));

    p9(2) = tmargin;
    p9(1) = round(find_line_x(vx,vy,app.RearWall(1,1),app.RearWall(1,2), p9(2) ));

    p3(2) = height - bmargin;
    p3(1) = round(find_line_x(vx,vy,app.RearWall(3,1),app.RearWall(3,2), p3(2) ));

    p11(1) = lmargin;
    p11(2) = round(find_line_y(vx,vy,app.RearWall(1,1),app.RearWall(1,2), p11(1) ));

    p5(1) = lmargin;
    p5(2) = round(find_line_y(vx,vy,app.RearWall(3,1),app.RearWall(3,2), p5(1) ));


end
 


