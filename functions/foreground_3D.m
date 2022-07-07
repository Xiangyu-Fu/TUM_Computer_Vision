function foreground_3D(app)

    
    [img_y, img_x, ~] = size(app.bim);

    FG(:,1) = app.FG_raw(:,1) + app.lmargin;
    FG(:,2) = app.FG_raw(:,2) + app.tmargin;

    app.FG_3d = zeros(size(FG));

    FG_recoord(:,1) = (FG(:,1) - app.VanishingPoint(1)) / img_x;
    FG_recoord(:,2) = -(FG(:,2) - app.VanishingPoint(2)) / img_y;


    ground = FG_recoord(3,2);

    eyep = [0, 0, 0];

    grad = -(1.0+ eyep(2) ) / (ground - eyep(2) );

    z = grad * (-1.0 - eyep(3) ) + eyep(3);

    for i = 1:4
        
        height = ( FG_recoord(i,2) - ground ) / -1*z;
        grad = (height - eyep(2) - 1) / ( FG_recoord(i,2) - eyep(2) );

        app.FG_3d(i,1) = grad * ( FG_recoord(i,1) - eyep(1) ) + eyep(1);
        app.FG_3d(i,2) = height - 1;
        app.FG_3d(i,3) = grad * (-1 - eyep(3) ) + eyep(3);

    end


end