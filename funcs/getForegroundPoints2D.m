
function  getForegroundPoints2D(app)
% getForegroundPoints2D.m uses getFg3D.m and the parameter app.K_trans
% /////////////////////////////////////////////////////////////
% FG_p1,FG_p2,FG_p3,FG_p4 Pixel coordinates of four Foreground points

% /////////Outputs/////////////////////////////////////////////
% app.FG_points_2d: Devide the third component of homogenous coordinates;
%                   Dimension: 4x2

%[FG_p1_3d,FG_p2_3d,FG_p3_3d,FG_p4_3d] = foreground_3D(app); % get Foreround points 3D coordinates

    transFG_p1_3 = app.K_trans * [app.FG_3d(1,:)';1];
    transFG_p1_3 = transFG_p1_3';
    transFG_p2_3 = app.K_trans * [app.FG_3d(2,:)';1];
    transFG_p2_3 = transFG_p2_3';
    transFG_p3_3 = app.K_trans * [app.FG_3d(3,:)';1];
    transFG_p3_3 = transFG_p3_3';
    transFG_p4_3 = app.K_trans * [app.FG_3d(4,:)';1];
    transFG_p4_3 = transFG_p4_3';

    if transFG_p1_3(3) >= 0
        showforeground = flase;
    else
        showforeground = true;
    end


     if showforeground 
        if transFG_p1_3(3) ~= 0
            transFG_p1_2(1) = transFG_p1_3(1)/transFG_p1_3(3);
            transFG_p1_2(2) = transFG_p1_3(2)/transFG_p1_3(3);
        else
            transFG_p1_2(1) = transFG_p1_3(1)/0.01;
            transFG_p1_2(2) = transFG_p1_3(2)/0.01;
        end
        
        if transFG_p2_3(3) ~= 0
            transFG_p2_2(1) = transFG_p2_3(1)/transFG_p2_3(3);
            transFG_p2_2(2) = transFG_p2_3(2)/transFG_p2_3(3);
        else
            transFG_p2_2(1) = transFG_p2_3(1)/0.01;
            transFG_p2_2(2) = transFG_p2_3(2)/0.01;
        end
        
        if transFG_p3_3(3) ~= 0
            transFG_p3_2(1) = transFG_p3_3(1)/transFG_p3_3(3);
            transFG_p3_2(2) = transFG_p3_3(2)/transFG_p3_3(3);
        else
            transFG_p3_2(1) = transFG_p3_3(1)/0.01;
            transFG_p3_2(2) = transFG_p3_3(2)/0.01;
        end
        
        if transFG_p4_3(3) ~= 0
            transFG_p4_2(1) = transFG_p4_3(1)/transFG_p4_3(3);
            transFG_p4_2(2) = transFG_p4_3(2)/transFG_p4_3(3);
        else
            transFG_p4_2(1) = transFG_p4_3(1)/0.01;
            transFG_p4_2(2) = transFG_p4_3(2)/0.01;
        end

     else
        transFG_p1_2(1)=0;
        transFG_p1_2(2)=0;
        transFG_p1_2(1)=0;
        transFG_p1_2(2)=0;
        transFG_p3_2(1)=0;
        transFG_p3_2(2)=0;
        transFG_p4_2(1)=0;
        transFG_p4_2(2)=0;
     end

        FG_points_2d = [transFG_p1_2; transFG_p2_2; transFG_p3_2; transFG_p4_2];
        app.FG_points_2d = round(FG_points_2d);


    