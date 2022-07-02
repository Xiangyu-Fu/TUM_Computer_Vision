function result = getNewTrapezoid(img, p1, p2, p3, p4, p1_new, p2_new, p3_new, p4_new)
    % Upper left: p1
    % Upper right: p2
    % Lower right: p3
    % Lower left: p4

    xmax = size(img,2);
    ymax = size(img,1);

    if (p1_new(1)+2*xmax)<(p3_new(1)+2*xmax)&&(p1_new(2)+2*ymax)<(p3_new(2)+2*ymax)

       % Create perspective transformation that warps the cutted rectangle (trapezoid)
       % coordinates to the traget shape (with 4 vertices).
    
        movingPoints = [p1; p2; p3; p4];
        fixedPoints = [p1_new; p2_new; p3_new; p4_new];
        
    
        tform = fitgeotrans(movingPoints, fixedPoints, 'Projective');
    
        % Create a reference coordinate system where the extent is the size of the image
    
        RA = imref2d([ymax xmax], [1 xmax], [1 ymax]);
    
        % Warp the image
    
        [result,r] = imwarp(img, tform, 'OutputView', RA);
    else
        result = zeros(size(img));
    end

end
