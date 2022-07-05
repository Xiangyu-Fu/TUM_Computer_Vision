function GetFixedSplitedRectFunc(app)
    app.NextStepButton_2.Visible = 'on';       
    app.NextStepButton_2.Enable = 'on';
    DrawLines(app);
    
    % get 5 rects and all 13 points (without VP)
    % topleft of the original image is defined as [0,0] 
    [p11, p10, p4, p5, p9, p3, p12, p6] = DrawFiveRects(app); 
    % draw 5 rects and also 
    % return 4 points (right and left wall points)
    
    p7 = app.RearWall(1,:);
    p8 = app.RearWall(2,:);
    p1 = app.RearWall(3,:);
    p2 = app.RearWall(4,:);
    
    app.Vertex = [p1;p2;p3;p4;p5;p6;p7;p8;p9;p10;p11;p12];

    app.UITable.Data = array2table(app.VanishingPoint);
    
    app.UITable_2.RowName={'1'; '2'; '3'; '4'; '5'; '6'; '7'; '8';'9';'10';'11';'12'};
    
    app.UITable_2.Data = array2table(app.Vertex);


%     % the front wall
    app.RearWall = splitTrapezoid (app.expandImage, p7, p8, p2, p1);  

    app.Ceil = splitTrapezoid (app.expandImage, p9, p10, p8, p7);
    
    app.Floor = splitTrapezoid (app.expandImage, p1, p2, p4, p3);
    
    app.RightWall = splitTrapezoid (app.expandImage, p8, p12, p6, p2);

    app.LeftWall = splitTrapezoid (app.expandImage, p11, p7, p1, p5);


end