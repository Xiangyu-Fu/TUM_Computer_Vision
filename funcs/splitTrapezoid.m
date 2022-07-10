function Trapezoid = splitTrapezoid (img, p1, p2, p3, p4)
    % Upper left: p1
    % Upper right: p2
    % Lower right: p3
    % Lower left: p4

    xmin = min([p1(1),p2(1),p3(1),p4(1)]);
    xmax = max([p1(1),p2(1),p3(1),p4(1)]);
    ymin = min([p1(2),p2(2),p3(2),p4(2)]);
    ymax = max([p1(2),p2(2),p3(2),p4(2)]);

    % Create a rectangle matrix fulled by 1, 

    cuttedImg_square = img(ymin+1:ymax, xmin+1:xmax, :);
%     ref = ones(size(cuttedImg_square,1),size(cuttedImg_square,2),3);

    ref = ones(size(img,1),size(img,2),3);

    % Create a perspective transform that warps the created white image 
    % coordinates into a trapezoid
%     cutted_p1 = [p1(1)-xmin, p1(2)-ymin];
%     cutted_p2 = [p2(1)-xmin, p2(2)-ymin];
%     cutted_p3 = [p3(1)-xmin, p3(2)-ymin];
%     cutted_p4 = [p4(1)-xmin, p4(2)-ymin];
%     

    movingPoints = [1 1;
                    size(ref,2) 1;
                    size(ref,2) size(ref,1); 
                    1 size(ref,1)];
%     fixedPoints = [cutted_p1; cutted_p2; cutted_p3; cutted_p4];
    fixedPoints = [p1; p2; p3; p4];
    tform = fitgeotrans(movingPoints, fixedPoints, 'Projective');

 
    % Create a reference coordinate system where the extent is the size of 
    % the image
    
    % The following 2 lines code: size of trapezoid will be changed, not the
    % original image size
%     RA = imref2d([size(cuttedImg_square,1),size(cuttedImg_square,2)], ...
%          [1 size(cuttedImg_square,2)], [1 size(cuttedImg_square,1)]);
% 
%     % The following 1 line code: the size of splited trapezoid will not be 
%     % changed, same to input image.  
    RA = imref2d([size(ref,1),size(ref,2)],[1 size(ref,2)],[1 size(ref,1)]);

    % Warp the image, trapezoidal area = 1 (white), other = 0 (black).
    [cuttedref,r] = imwarp(ref, tform, 'OutputView', RA);

    % The original rectangular image is multiplied by the trapezoidal 
    % white image to obtain the target trapezoidal image
%     Trapezoid = cuttedImg_square.*cuttedref;

    Trapezoid = img.*cuttedref;
end


