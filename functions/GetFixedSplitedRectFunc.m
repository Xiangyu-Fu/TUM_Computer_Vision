function GetFixedSplitedRectFunc(app)
    app.NextStepButton_2.Visible = 'on';       
    app.NextStepButton_2.Enable = 'on';
    DrawLines(app);
    
    % get 5 rects and all 13 points (without VP)
    % topleft of the original image is defined as [0,0] 
    [p11, p10, p4, p5, p9, p3, p12, p6,lmargin,rmargin,tmargin,bmargin] = DrawFiveRects(app); 
    % draw 5 rects and also 
    % return 4 points (right and left wall points)
    
    p7 = app.RealWall(1,:);
    p8 = app.RealWall(2,:);
    p1 = app.RealWall(3,:);
    p2 = app.RealWall(4,:);
    
    app.Vertex = [p1;p2;p3;p4;p5;p6;p7;p8;p9;p10;p11;p12];
    
    app.UITable_2.RowName={'1'; '2'; '3'; '4'; '5'; '6'; '7'; '8';'9';'10';'11';'12'};
    
    app.UITable_2.Data = array2table(app.Vertex);
    
    
    app.UITable_3.RowName={'vp';'7'; '8'; '1'; '2'; '11'; '10'; '4'; '5';'9';'3';'12';'6'};
    
    vp(1) = app.VanishingPoint(1)+lmargin;
    vp(2) = app.VanishingPoint(2)+tmargin;
    
    [vp_3d, p7_3d, p8_3d, p1_3d, p2_3d, p11_3d,...
        p10_3d, p4_3d, p5_3d, p9_3d, p3_3d, p12_3d, p6_3d] = get3D(...
        vp, p7, p8, p1, p2, p11, p10, p4, p5, p9, p3, p12, p6,lmargin,rmargin);
    
    points_3d = [vp_3d; p7_3d; p8_3d; p1_3d; p2_3d; p11_3d;...
        p10_3d; p4_3d; p5_3d; p9_3d; p3_3d; p12_3d; p6_3d];
    
    app.UITable_3.Data = array2table(points_3d);
    
    % the front wall
    app.RealWall = app.expandImage(p7(2):p1(2), p7(1):p8(1), :);  
    
    
    app.Ceil = splitTrapezoid (app.expandImage, p9, p10, p8, p7);
    %                 figure;
    %                 imshow(app.Ceil);
    app.fixedCeil = fixTrapezoid (app.Ceil, p9, p10, p8, p7);
    %                 figure;
    %                 imshow(app.fixedCeil);
    
    app.Floor = splitTrapezoid (app.expandImage, p1, p2, p4, p5);
    %                 figure;
    %                 imshow(app.Floor);
    app.fixedFloor = fixTrapezoid (app.Floor, p1, p2, p4, p5);
    %                 figure;
    %                 imshow(app.fixedFloor);
    % 
    app.RightWall = splitTrapezoid (app.expandImage, p8, p10, p4, p2);
    %                 figure;
    %                 imshow(app.RightWall);
    app.fixedRightWall = fixTrapezoid (app.RightWall, p8, p10, p4, p2);
    %                 figure;
    %                 imshow(app.fixedRightWall);
    % 
    app.LeftWall = splitTrapezoid (app.expandImage, p11, p7, p1, p5);
    %                 figure;
    %                 imshow(app.LeftWall);
    app.fixedLeftWall = fixTrapezoid (app.LeftWall, p11, p7, p1, p5);
    %                 figure;
    %                 imshow(app.fixedLeftWall);

end