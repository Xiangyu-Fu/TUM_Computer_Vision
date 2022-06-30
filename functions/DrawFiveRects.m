function [p11, p10, p4, p5, p9, p3, p12, p6,lmargin,rmargin,tmargin,bmargin,height, width] = DrawFiveRects(app)
    
    [bim,bim_alpha,vx,vy,ceilrx,ceilry,floorrx,floorry,...
    leftrx,leftry,rightrx,rightry,backrx,backry,lmargin,rmargin,tmargin,bmargin] = ...
    get5rects(app);

    [orx,ory] = get4vertices(app);

    [height, width, channel] = size(bim);

    % display the expended image
    imshow(bim,'Parent', app.UIAxes_3);    
    hold(app.UIAxes_3, 'on' );
    % Here is one way to use the alpha channel (works for 3D plots too!)
    %%alpha(bim_alpha);
    
    % Draw the Vanishing Point and the 4 faces on the image
    plot(vx,vy,'w*', 'Parent', app.UIAxes_3);


    plot([ceilrx ceilrx(1)], [ceilry ceilry(1)], 'y-','Parent', app.UIAxes_3);
    plot([floorrx floorrx(1)], [floorry floorry(1)], 'm-','Parent', app.UIAxes_3);
    plot([leftrx leftrx(1)], [leftry leftry(1)], 'c-','Parent', app.UIAxes_3);
    plot([rightrx rightrx(1)], [rightry rightry(1)], 'g-','Parent', app.UIAxes_3);
    

    p9 = [leftrx(1) leftry(1)];
    p3 = [leftrx(4) leftry(4)];
    p12 =[rightrx(2) rightry(2)];
    p6 = [rightrx(3) rightry(3)];

    p11 = [orx(1)+lmargin ory(1)+tmargin];
    p10 = [orx(2)+lmargin ory(2)+tmargin];
    p4 = [orx(3)+lmargin ory(3)+tmargin];
    p5 = [orx(4)+lmargin ory(4)+tmargin];

    if (p9(1) < lmargin)
        p9(1) = lmargin;
        p9(2) = round(find_line_y(vx,vy,leftrx(1),leftry(1), lmargin));
    elseif (p9(2) < tmargin)
        p9(2) = tmargin;
        p9(1) = round(find_line_x(vx,vy,leftrx(1),leftry(1), tmargin));
    end

    if (p3(1) < lmargin)
        p3(1) = lmargin;
        p3(2) = round(find_line_y(vx,vy,leftrx(1),leftry(1), lmargin));
    elseif (p3(2) > (height - bmargin) )
        p3(2) = height - bmargin;
        p3(1) = round(find_line_x(vx,vy,leftrx(4),leftry(4), p3(2)));
    end


    if (p12(1) > width - rmargin)
        p12(1) = width - rmargin;
        p12(2) = round(find_line_y(vx,vy,rightrx(2),rightry(2), p12(1) ));
    elseif (p12(2) < tmargin)
        p12(2) = tmargin;
        p12(1) = round(find_line_x(vx,vy,rightrx(2),rightry(2), p12(2) ));
    end

    if (p6(1) > width - rmargin )
        p6(1) = width - rmargin;
        p6(2) = round(find_line_y(vx,vy,rightrx(3),rightry(3), p6(1) ));
    elseif (p6(2) > height - bmargin)
        p6(2) = height - bmargin;
        p6(1) = round(find_line_x(vx,vy,rightrx(3),rightry(3), p6(2) ));
    end

    wallPoints = [p9;p3;p12;p6];
    verticesPoints = [p11;p10;p4;p5];

    plot(verticesPoints(:,1),verticesPoints(:,2), 'r*','MarkerSize',15,'Parent', app.UIAxes_3);
    
    plot(wallPoints(:,1),wallPoints(:,2),'g*','MarkerSize',15,'Parent', app.UIAxes_3)



    % return points corrdinates by defining the topleft of origin image as 0,0
    

%     p9 = [p9(1)+1 p9(2)+1];
%     p3 = [p3(1)+1 p3(2)+1];
%     p12 =[p12(1) p12(2)];
%     p6 = [p6(1) p6(2)];
% 
%     p11 = [p11(1)+1 p11(2)+1];
%     p10 = [p10(1) p10(2)+1];
%     p4 = [p4(1) p4(2)];
%     p5 = [p5(1)+1 p5(2)+1];

    app.RealWall(1,:) = [app.RealWall(1,1) + lmargin, app.RealWall(1,2) + tmargin];
    app.RealWall(2,:) = [app.RealWall(2,1) + lmargin, app.RealWall(2,2) + tmargin];
    app.RealWall(3,:) = [app.RealWall(3,1) + lmargin, app.RealWall(3,2) + tmargin];
    app.RealWall(4,:) = [app.RealWall(4,1) + lmargin, app.RealWall(4,2) + tmargin];
    app.VanishingPoint = [app.VanishingPoint(1) + lmargin, app.VanishingPoint(2) + tmargin];
    app.expandImage = bim;


    hold(app.UIAxes_2, 'off' );


    %%% for test
    figure(1);
    
    imshow(bim);

    hold on;
    plot(vx,vy,'w*');
    plot([ceilrx ceilrx(1)], [ceilry ceilry(1)], 'y-');
    plot([floorrx floorrx(1)], [floorry floorry(1)], 'm-');
    plot([leftrx leftrx(1)], [leftry leftry(1)], 'c-');
    plot([rightrx rightrx(1)], [rightry rightry(1)], 'g-');

    plot(verticesPoints(:,1),verticesPoints(:,2), 'r*','MarkerSize',15);
    plot(wallPoints(:,1),wallPoints(:,2),'g*','MarkerSize',15);

    hold off;





    %%% test ends

end
 


