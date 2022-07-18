function result = getNewTrapezoid(cases, img, p1, p2, p3, p4, p1_new, p2_new, p3_new, p4_new, judgePts1, judgePts2, judgePts3, judgePts4)
    % cases: 'fc' floor and ceil, 'lr' left and right wall, 'f' rearwall
    %           and foreground.
    % Upper left: p1
    % Upper right: p2
    % Lower right: p3
    % Lower left: p4
    % judgePts1: pixel coordinates in image plain, upper left.
    % judgePts2: pixel coordinates in image plain, lower right.

    xmax = size(img,2);
    ymax = size(img,1);

    switch cases
        case 'fc'
            if (judgePts1(2)+ymax)<(judgePts3(2)+ymax)||(judgePts2(2)+ymax)<(judgePts4(2)+ymax)
                % Create perspective transformation that warps the cutted rectangle (trapezoid)
                % coordinates to the traget shape (with 4 vertices).
        
                movingPoints = [p1; p2; p3; p4];
                fixedPoints = [p1_new; p2_new; p3_new; p4_new];
        
        
                tform = fitgeotrans(movingPoints, fixedPoints, 'Projective');
        
                % Create a reference coordinate system where the extent is the size of the image
        
                RA = imref2d([ymax xmax], [1 xmax], [1 ymax]);
        
                % Warp the image
                [result,~] = imwarp(img, tform, 'OutputView', RA);
            else
                result = zeros(ymax,xmax,3);
            end
        case 'lr'
            if (judgePts1(1)+xmax)<(judgePts3(1)+xmax)||(judgePts4(1)+xmax)<(judgePts2(1)+xmax)
                % Create perspective transformation that warps the cutted rectangle (trapezoid)
                % coordinates to the traget shape (with 4 vertices).
        
                movingPoints = [p1; p2; p3; p4];
                fixedPoints = [p1_new; p2_new; p3_new; p4_new];
        
        
                tform = fitgeotrans(movingPoints, fixedPoints, 'Projective');
        
                % Create a reference coordinate system where the extent is the size of the image
        
                RA = imref2d([ymax xmax], [1 xmax], [1 ymax]);
        
                % Warp the image
                [result,~] = imwarp(img, tform, 'OutputView', RA);
            else
                result = zeros(ymax,xmax,3);
            end
         case 'f'
             % Create perspective transformation that warps the cutted rectangle (trapezoid)
             % coordinates to the traget shape (with 4 vertices).

             movingPoints = [p1; p2; p3; p4];
             fixedPoints = [p1_new; p2_new; p3_new; p4_new];


             tform = fitgeotrans(movingPoints, fixedPoints, 'Projective');

             % Create a reference coordinate system where the extent is the size of the image

             RA = imref2d([ymax xmax], [1 xmax], [1 ymax]);

             % Warp the image
             [result,~] = imwarp(img, tform, 'OutputView', RA);
    end

end