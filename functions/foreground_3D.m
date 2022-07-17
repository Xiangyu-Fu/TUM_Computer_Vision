function foreground_3D(app)

    [img_y, img_x, ~] = size(app.bim);

    app.FG(:,1) = app.FG_raw(:,1) + app.lmargin;
    app.FG(:,2) = app.FG_raw(:,2) + app.tmargin;

    app.FG_3d = zeros(size(app.FG));

    FG_recoord(:,1) = (app.FG(:,1) - app.VP(1)) / img_x;
    FG_recoord(:,2) = -(app.FG(:,2) - app.VP(2)) / img_y;

    eyep = [0, 0, 0];



    for j = 1:app.FG_count

        ground = FG_recoord(4*j-1,2);
    
        grad = -(1.0+ eyep(2) ) / (ground - eyep(2) );
    
        z = grad * (-1.0 - eyep(3) ) + eyep(3);

        for i = 4*j-3:4*j
            
            height = ( FG_recoord(i,2) - ground ) / -1*z;
            grad = (height - eyep(2) - 1) / ( FG_recoord(i,2) - eyep(2) );
    
            app.FG_3d(i,1) = grad * ( FG_recoord(i,1) - eyep(1) ) + eyep(1);
            app.FG_3d(i,2) = height - 1;
            app.FG_3d(i,3) = grad * (-1 - eyep(3) ) + eyep(3);
            
        end
    end


end
