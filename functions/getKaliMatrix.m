function K = getKaliMatrix(eye_3d, v1_3d, v2_3d, vp_2d, v1_2d, v2_2d)
    v1_3d = v1_3d - eye_3d;
    v2_3d = v2_3d - eye_3d;
    
    o_x = vp_2d(1);
    o_y = vp_2d(2);
    K_11 = (v1_3d(3) * v1_2d(1) - v2_3d(3) * v2_2d(1) - o_x * (v1_3d(3) - v2_3d(3))) / (v1_3d(1) - v2_3d(1));
    K_12 = K_11 * v1_3d(1) + o_x * v1_3d(3) - v1_3d(3) * v1_2d(1);
    K_22 = v1_3d(3) * (o_y - v1_2d(1));
    K = [K_11 K_12 o_x;
         0    K_22 o_y;
         0    0    1  ];
    Pi_0 = [1 0 0 0;
            0 1 0 0;
            0 0 1 0];
    K = K * Pi_0;
