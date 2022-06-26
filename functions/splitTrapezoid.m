function Trapezoid = splitTrapezoid (img, p1, p2, p3, p4)

    % Upper left: p1
    % Upper right: p2
    % Lower right: p3
    % Lower left: p4

    xmin = min([p1(1),p2(1),p3(1),p4(1)]);
    xmax = max([p1(1),p2(1),p3(1),p4(1)]);
    ymin = min([p1(2),p2(2),p3(2),p4(2)]);
    ymax = max([p1(2),p2(2),p3(2),p4(2)]);

    cuttedImg_square = im2double(img(ymin:ymax, xmin:xmax, :));
    ref = ones(size(cuttedImg_square,1),size(cuttedImg_square,2),3);

    cutted_p1 = [p1(1)-xmin, p1(2)-ymin];
    cutted_p2 = [p2(1)-xmin, p2(2)-ymin];
    cutted_p3 = [p3(1)-xmin, p3(2)-ymin];
    cutted_p4 = [p4(1)-xmin, p4(2)-ymin];
%     Create perspective transformation that warps the original 
%     image coordinates to the trapezoid

    movingPoints = [1 1; size(ref,2) 1; size(ref,2) size(ref,1); 1 size(ref,1)];

    fixedPoints = [cutted_p1; cutted_p2; cutted_p3; cutted_p4];

    tform = fitgeotrans(movingPoints, fixedPoints, 'Projective');

 
%     Create a reference coordinate system where the extent is the size of the image

    RA = imref2d([size(cuttedImg_square,1) size(cuttedImg_square,2)], ...
        [1 size(cuttedImg_square,2)], [1 size(cuttedImg_square,1)]);

%     Warp the image

    [cuttedref,r] = imwarp(ref, tform, 'OutputView', RA);
    Trapezoid = cuttedImg_square.*cuttedref;
end


