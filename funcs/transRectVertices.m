function transRectVerticesCoord_pix = transRectVertices(app)
    points_3d = app.points_3d;
    CameraMatrix = app.CameraMatrix;
    x = app.x;
    y = app.y;
    z = app.z;
    theta = app.theta;
    phi = app.phi;
    transRectVerticesCoord_3d = zeros(12,3);

    for i = 1:12
        transRectVerticesCoord_3d(i,:) = [points_3d(i,1), points_3d(i,2),...
        points_3d(i,3)-z+tan(theta)*(x-points_3d(i,1))-tan(phi)*(y-points_3d(i,2))];
    end

    transRectVerticesCoord_homo = zeros(12,3);
    transRectVerticesCoord_pix = zeros(12,2);

    for i = 1:12
        transRectVerticesCoord_homo(i,:) = (CameraMatrix * [transRectVerticesCoord_3d(i,:)';1])';
        transRectVerticesCoord_pix(i,1) = transRectVerticesCoord_homo(i,1)/transRectVerticesCoord_homo(i,3);
        transRectVerticesCoord_pix(i,2) = transRectVerticesCoord_homo(i,2)/transRectVerticesCoord_homo(i,3);
    end
end