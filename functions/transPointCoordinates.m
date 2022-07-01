function [transVP_3, transP1_3, transP2_3, transP3_3, transP4_3, transP5_3,...
    transP6_3, transP7_3, transP8_3, transP9_3, transP10_3, transP11_3,...
    transP12_3, transVP_2, transP1_2, transP2_2, transP3_2, transP4_2, transP5_2,...
    transP6_2, transP7_2, transP8_2, transP9_2, transP10_2, transP11_2,...
    transP12_2] =  transPointCoordinates(K_trans, vp_3d, p1_3d,... 
    p2_3d, p3_3d, p4_3d, p5_3d, p6_3d, p7_3d, p8_3d, ...
    p9_3d, p10_3d, p11_3d, p12_3d)

    transVP_3 = K_trans * [vp_3d';1];
    transVP_3 = transVP_3';
    if transVP_3(3) ~= 0
        transVP_2(1) = transVP_3(1)/transVP_3(3);
        transVP_2(2) = transVP_3(2)/transVP_3(3);
    else
        transVP_2(1) = transVP_3(1)/0.01;
        transVP_2(2) = transVP_3(2)/0.01;
    end
    
    transP1_3 = K_trans * [p1_3d';1];
    transP1_3 = transP1_3';
    if transP1_3(3) ~= 0
        transP1_2(1) = transP1_3(1)/transP1_3(3);
        transP1_2(2) = transP1_3(2)/transP1_3(3);
    else
        transP1_2(1) = transP1_3(1)/0.01;
        transP1_2(2) = transP1_3(2)/0.01;
    end
    
    transP2_3 = K_trans * [p2_3d';1];
    transP2_3 = transP2_3';
    if transP2_3(3) ~= 0
        transP2_2(1) = transP2_3(1)/transP2_3(3);
        transP2_2(2) = transP2_3(2)/transP2_3(3);
    else
        transP2_2(1) = transP2_3(1)/0.01;
        transP2_2(2) = transP2_3(2)/0.01;
    end
    
    transP3_3 = K_trans * [p3_3d';1];
    transP3_3 = transP3_3';
    if transP3_3(3) ~= 0
        transP3_2(1) = transP3_3(1)/transP3_3(3);
        transP3_2(2) = transP3_3(2)/transP3_3(3);
    else
        transP3_2(1) = transP3_3(1)/0.01;
        transP3_2(2) = transP3_3(2)/0.01;
    end
    
    transP4_3 = K_trans * [p4_3d';1];
    transP4_3 = transP4_3';
    if transP4_3(3) ~= 0
        transP4_2(1) = transP4_3(1)/transP4_3(3);
        transP4_2(2) = transP4_3(2)/transP4_3(3);
    else
        transP4_2(1) = transP4_3(1)/0.01;
        transP4_2(2) = transP4_3(2)/0.01;
    end
    
    transP5_3 = K_trans * [p5_3d';1];
    transP5_3 = transP5_3';
    if transP5_3(3) ~= 0
        transP5_2(1) = transP5_3(1)/transP5_3(3);
        transP5_2(2) = transP5_3(2)/transP5_3(3);
    else
        transP5_2(1) = transP5_3(1)/0.01;
        transP5_2(2) = transP5_3(2)/0.01;
    end
    
    transP6_3 = K_trans * [p6_3d';1];
    transP6_3 = transP6_3';
    if transP6_3(3) ~= 0
        transP6_2(1) = transP6_3(1)/transP6_3(3);
        transP6_2(2) = transP6_3(2)/transP6_3(3);
    else
        transP6_2(1) = transP6_3(1)/0.01;
        transP6_2(2) = transP6_3(2)/0.01;
    end
    
    transP7_3 = K_trans * [p7_3d';1];
    transP7_3 = transP7_3';
    if transP7_3(3) ~= 0
        transP7_2(1) = transP7_3(1)/transP7_3(3);
        transP7_2(2) = transP7_3(2)/transP7_3(3);
    else
        transP7_2(1) = transP7_3(1)/0.01;
        transP7_2(2) = transP7_3(2)/0.01;
    end
    
    transP8_3 = K_trans * [p8_3d';1];
    transP8_3 = transP8_3';
    if transP8_3(3) ~= 0
        transP8_2(1) = transP8_3(1)/transP8_3(3);
        transP8_2(2) = transP8_3(2)/transP8_3(3);
    else
        transP8_2(1) = transP8_3(1)/0.01;
        transP8_2(2) = transP8_3(2)/0.01;
    end
    
    transP9_3 = K_trans * [p9_3d';1];
    transP9_3 = transP9_3';
    if transP9_3(3) ~= 0
        transP9_2(1) = transP9_3(1)/transP9_3(3);
        transP9_2(2) = transP9_3(2)/transP9_3(3);
    else
        transP9_2(1) = transP9_3(1)/0.01;
        transP9_2(2) = transP9_3(2)/0.01;
    end
    
    transP10_3 = K_trans * [p10_3d';1];
    transP10_3 = transP10_3';
    if transP10_3(3) ~= 0
        transP10_2(1) = transP10_3(1)/transP10_3(3);
        transP10_2(2) = transP10_3(2)/transP10_3(3);
    else
        transP10_2(1) = transP10_3(1)/0.01;
        transP10_2(2) = transP10_3(2)/0.01;
    end
    
    transP11_3 = K_trans * [p11_3d';1];
    transP11_3 = transP11_3';
    if transP11_3(3) ~= 0
        transP11_2(1) = transP11_3(1)/transP11_3(3);
        transP11_2(2) = transP11_3(2)/transP11_3(3);
    else
        transP11_2(1) = transP11_3(1)/0.01;
        transP11_2(2) = transP11_3(2)/0.01;
    end
    
    transP12_3 = K_trans * [p12_3d';1];
    transP12_3 = transP12_3';
    if transP12_3(3) ~= 0
        transP12_2(1) = transP12_3(1)/transP12_3(3);
        transP12_2(2) = transP12_3(2)/transP12_3(3);
    else
        transP12_2(1) = transP12_3(1)/0.01;
        transP12_2(2) = transP12_3(2)/0.01;
    end
    
    
        