function result = getRect(p1, p2, p3, p4, img)

    % Upper left: p1
    % Upper right: p2
    % Lower right: p3
    % Lower left: p4

    xmin = min([p1(1),p2(1),p3(1),p4(1)]);
    xmax = max([p1(1),p2(1),p3(1),p4(1)]);
    ymin = min([p1(2),p2(2),p3(2),p4(2)]);
    ymax = max([p1(2),p2(2),p3(2),p4(2)]);

    p1 = [p1(1)-xmin+1, p1(2)-ymin+1];
    p2 = [p2(1)-xmin+1, p2(2)-ymin+1];
    p3 = [p3(1)-xmin+1, p3(2)-ymin+1];
    p4 = [p4(1)-xmin+1, p4(2)-ymin+1];

%     Create perspective transformation that warps the original 
%     image coordinates to the trapezoid

    movingPoints = [p1; p2; p3; p4];
    fixedPoints = [1 1; xmax 1; xmax ymax; 1 ymax];
    

    tform = fitgeotrans(movingPoints, fixedPoints, 'Projective');

 
%     Create a reference coordinate system where the extent is the size of the image

    RA = imref2d([ymax xmax], ...
        [1 xmax], [1 ymax]);

%     Warp the image

    [result,r] = imwarp(img, tform, 'OutputView', RA);

end
