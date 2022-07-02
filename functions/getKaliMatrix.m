function K = getKaliMatrix(p1_3d, p2_3d, vp_2d, p1_2d, p2_2d)    
% getKaliMatrix.m calculates the original camera matrix
% Inputs:
% p1_3d, p2_3d: World coordinates of p1 and p2
% vp_2d, p1_2d, p3_2d: Pixel coordinates of vanishing point, p1 and p2
% Outputs:
% K: Camera matrix of dimension 3x4

    o_x = vp_2d(1);
    o_y = vp_2d(2);
    K_11 = (p1_3d(3) * (p1_2d(1) - o_x) * p2_3d(2) - ...
            p2_3d(3) * (p2_2d(1) - o_x) * p1_3d(2)) / ...
            (p1_3d(1) * p2_3d(2) - p2_3d(1) * p1_3d(2));
    K_12 = (p1_3d(3) * (p1_2d(1) - o_x) * p2_3d(1) - ...
            p2_3d(3) * (p2_2d(1) - o_x) * p1_3d(1)) / ...
            (p1_3d(2) * p2_3d(1) - p2_3d(2) * p1_3d(1));
    K_22 = p1_3d(3) * (p1_2d(2) - o_y) / p1_3d(2);
    K = [K_11 K_12 o_x;
         0    K_22 o_y;
         0    0    1  ];
    Pi_0 = [1 0 0 0;
            0 1 0 0;
            0 0 1 0];
    K = K * Pi_0;
