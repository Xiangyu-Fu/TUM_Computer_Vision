function getTransCoordinates2D(app)

    cameraMatrix = getKaliMatrix(app);
    K_trans = getTransMatrix(app, cameraMatrix);
    transPointCoordinates(K_trans, app);

 
function cameraMatrix = getKaliMatrix(app)    
% getKaliMatrix.m calculates the original camera matrix
% Inputs:
% p1_3d, p2_3d: World coordinates of p1 and p2
% vp_2d, p1_2d, p3_2d: Pixel coordinates of vanishing point, p1 and p2
% Outputs:
% cameraMatrix: Camera matrix of dimension 3x4
    p1_3d = app.points_3d(1, :);
    p2_3d = app.points_3d(2, :);
    vp_2d = app.VP;
    p1_2d = app.points_2d(1, :);
    p2_2d = app.points_2d(2, :);

    o_x = vp_2d(1);
    o_y = vp_2d(2);
    K_11 = (p1_3d(3) * (p1_2d(1) - o_x) * p2_3d(2) - ...
            p2_3d(3) * (p2_2d(1) - o_x) * p1_3d(2)) / ...
            (p1_3d(1) * p2_3d(2) - p2_3d(1) * p1_3d(2));
    K_12 = (p1_3d(3) * (p1_2d(1) - o_x) * p2_3d(1) - ...
            p2_3d(3) * (p2_2d(1) - o_x) * p1_3d(1)) / ...
            (p1_3d(2) * p2_3d(1) - p2_3d(2) * p1_3d(1));
    K_22 = p1_3d(3) * (p1_2d(2) - o_y) / p1_3d(2);
    cameraMatrix = [K_11 K_12 o_x;
         0    K_22 o_y;
         0    0    1  ];
    Pi_0 = [1 0 0 0;
            0 1 0 0;
            0 0 1 0];
    cameraMatrix = cameraMatrix * Pi_0;
    app.CameraMatrix = cameraMatrix;



function K_trans = getTransMatrix(app, K)
% getTransMatrix calculates the camera matrix after transformation
% Inputs: 
% theta: yaw in rad
% phi: pitch in rad
% x, y, z: displacement
% K: original camera matrix
% Outputs:
% K_trans: camera matrix after transformation in dimension 3x4
% RT: rotation matrix ; displacement
    phi = app.phi;
    theta = app.theta;
    x = app.x;
    y = app.y;
    z = app.z;
    %K = app.K;

    R = [cos(theta)              0         sin(theta);
         -sin(theta) * sin(phi)   cos(phi)  cos(theta) * sin(phi);
         -sin(theta) * cos(phi)  -sin(phi)  cos(theta) * cos(phi)];
    T = [-x; -y; z];
    RT = [R T; 0 0 0 1];
    K_trans = K * RT;
    app.K_trans = K_trans;


function [trans_points_3d, trans_points_2d] =  transPointCoordinates(K_trans, app)
% transPointCoordinates.m calculates point coordinates after sight transformation
% Inputs:
% K_trans: Camera matrix after transformation
% ..._3d: World coordinates of vertices
% Outputs:
% trans..._3: Homogeneous coordinates of vertices after transformation;
%             dimension 1x3
% trans..._2: Devide the third component of homogenous coordinates;
%             dimension 1x2

    transVP_3 = K_trans * [app.points_3d(13, :)';1];
    transVP_3 = transVP_3';
    if transVP_3(3) ~= 0
        transVP_2(1) = transVP_3(1)/transVP_3(3);
        transVP_2(2) = transVP_3(2)/transVP_3(3);
    else
        transVP_2(1) = transVP_3(1)/0.01;
        transVP_2(2) = transVP_3(2)/0.01;
    end
    
    transP1_3 = K_trans * [app.points_3d(1, :)';1];
    transP1_3 = transP1_3';
 
    if transP1_3(3) ~= 0
        transP1_2(1) = transP1_3(1)/transP1_3(3);
        transP1_2(2) = transP1_3(2)/transP1_3(3);
    else
        transP1_2(1) = transP1_3(1)/0.01;
        transP1_2(2) = transP1_3(2)/0.01;
    end

    
    transP2_3 = K_trans * [app.points_3d(2, :)';1];
    transP2_3 = transP2_3';
    
    if transP2_3(3) ~= 0
        transP2_2(1) = transP2_3(1)/transP2_3(3);
        transP2_2(2) = transP2_3(2)/transP2_3(3);
    else
        transP2_2(1) = transP2_3(1)/0.01;
        transP2_2(2) = transP2_3(2)/0.01;
    end
    
    transP3_3 = K_trans * [app.points_3d(3, :)';1];
    transP3_3 = transP3_3';
    
    if transP3_3(3) ~= 0
        transP3_2(1) = transP3_3(1)/transP3_3(3);
        transP3_2(2) = transP3_3(2)/transP3_3(3);
    else
        transP3_2(1) = transP3_3(1)/0.01;
        transP3_2(2) = transP3_3(2)/0.01;
    end
    
    transP4_3 = K_trans * [app.points_3d(4, :)';1];
    transP4_3 = transP4_3';
    
    if transP4_3(3) ~= 0
        transP4_2(1) = transP4_3(1)/transP4_3(3);
        transP4_2(2) = transP4_3(2)/transP4_3(3);
    else
        transP4_2(1) = transP4_3(1)/0.01;
        transP4_2(2) = transP4_3(2)/0.01;
    end
    
    transP5_3 = K_trans * [app.points_3d(5, :)';1];
    transP5_3 = transP5_3';
    
    if transP5_3(3) ~= 0
        transP5_2(1) = transP5_3(1)/transP5_3(3);
        transP5_2(2) = transP5_3(2)/transP5_3(3);
    else
        transP5_2(1) = transP5_3(1)/0.01;
        transP5_2(2) = transP5_3(2)/0.01;
    end
    
    transP6_3 = K_trans * [app.points_3d(6, :)';1];
    transP6_3 = transP6_3';
    
    if transP6_3(3) ~= 0
        transP6_2(1) = transP6_3(1)/transP6_3(3);
        transP6_2(2) = transP6_3(2)/transP6_3(3);
    else
        transP6_2(1) = transP6_3(1)/0.01;
        transP6_2(2) = transP6_3(2)/0.01;
    end
    
    transP7_3 = K_trans * [app.points_3d(7, :)';1];
    transP7_3 = transP7_3';
    
    if transP7_3(3) ~= 0
        transP7_2(1) = transP7_3(1)/transP7_3(3);
        transP7_2(2) = transP7_3(2)/transP7_3(3);
    else
        transP7_2(1) = transP7_3(1)/0.01;
        transP7_2(2) = transP7_3(2)/0.01;
    end
    
    transP8_3 = K_trans * [app.points_3d(8, :)';1];
    transP8_3 = transP8_3';
   
    if transP8_3(3) ~= 0
        transP8_2(1) = transP8_3(1)/transP8_3(3);
        transP8_2(2) = transP8_3(2)/transP8_3(3);
    else
        transP8_2(1) = transP8_3(1)/0.01;
        transP8_2(2) = transP8_3(2)/0.01;
    end
    
    transP9_3 = K_trans * [app.points_3d(9, :)';1];
    transP9_3 = transP9_3';
    
    if transP9_3(3) ~= 0
        transP9_2(1) = transP9_3(1)/transP9_3(3);
        transP9_2(2) = transP9_3(2)/transP9_3(3);
    else
        transP9_2(1) = transP9_3(1)/0.01;
        transP9_2(2) = transP9_3(2)/0.01;
    end
    
    transP10_3 = K_trans * [app.points_3d(10, :)';1];
    transP10_3 = transP10_3';
    
    if transP10_3(3) ~= 0
        transP10_2(1) = transP10_3(1)/transP10_3(3);
        transP10_2(2) = transP10_3(2)/transP10_3(3);
    else
        transP10_2(1) = transP10_3(1)/0.01;
        transP10_2(2) = transP10_3(2)/0.01;
    end
    
    transP11_3 = K_trans * [app.points_3d(11, :)';1];
    transP11_3 = transP11_3';
    
    if transP11_3(3) ~= 0
        transP11_2(1) = transP11_3(1)/transP11_3(3);
        transP11_2(2) = transP11_3(2)/transP11_3(3);
    else
        transP11_2(1) = transP11_3(1)/0.01;
        transP11_2(2) = transP11_3(2)/0.01;
    end
    
    transP12_3 = K_trans * [app.points_3d(12, :)';1];
    transP12_3 = transP12_3';
    
    if transP12_3(3) ~= 0
        transP12_2(1) = transP12_3(1)/transP12_3(3);
        transP12_2(2) = transP12_3(2)/transP12_3(3);
    else
        transP12_2(1) = transP12_3(1)/0.01;
        transP12_2(2) = transP12_3(2)/0.01;
    end
    
    trans_points_3d = [transP1_3;transP2_3;transP3_3;transP4_3;...
                       transP5_3;transP6_3;transP7_3;transP8_3;...
                       transP9_3;transP10_3;transP11_3;transP12_3;transVP_3];
    trans_points_2d = [transP1_2;transP2_2;transP3_2;transP4_2;...
                       transP5_2;transP6_2;transP7_2;transP8_2;...
                       transP9_2;transP10_2;transP11_2;transP12_2;transVP_2];
    app.trans_points_3d = trans_points_3d;
    app.trans_points_2d = trans_points_2d;
    
        