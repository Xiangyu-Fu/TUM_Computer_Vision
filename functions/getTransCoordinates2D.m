function [transVP_3, transP1_3, transP2_3, transP3_3, transP4_3, transP5_3,...
    transP6_3, transP7_3, transP8_3, transP9_3, transP10_3, transP11_3,...
    transP12_3, transVP_2, transP1_2, transP2_2, transP3_2, transP4_2, transP5_2,...
    transP6_2, transP7_2, transP8_2, transP9_2, transP10_2, transP11_2,...
    transP12_2, K_trans] =  getTransCoordinates2D(vp, p7, p8, p1, p2, p11, p10, ...
    p4, p5, p9, p3, p12, p6,height, width, theta, phi, x, y, z)
% getTransCoordinates2D.m integrates get3D.m, getKaliMatrix,
% getTransMatrix.m, and transPointCoordinates.m together.
% Inputs:
% vp,...,p12: Pixel coordinates of vanishing points and vertices
% height: Image height
% width: Image width
% theta: yaw in rad
% phi: pitch in rad
% z: displacement
% Outputs:
% trans..._3: Homogeneous coordinates of vertices after transformation;
%             dimension 1x3
% trans..._2: Devide the third component of homogenous coordinates;
%             dimension 1x2
% K_trans: camera matrix after transformation in dimension 3x4
    
    vp_2d = vp; p1_2d = p1; p2_2d = p2; p3_2d = p3;
    p4_2d = p4; p5_2d = p5; p6_2d = p6; p7_2d = p7;
    p8_2d = p8; p9_2d = p9; p10_2d = p10; p11_2d = p11; p12_2d = p12;

    [vp_3d, p7_3d, p8_3d, p1_3d, p2_3d, p11_3d,...
    p10_3d, p4_3d, p5_3d, p9_3d, p3_3d, p12_3d, p6_3d, eyep] = get3D(...
    vp, p7, p8, p1, p2, p11, p10, p4, p5, p9, p3, p12, p6,height, width);

    K = getKaliMatrix(p1_3d, p2_3d, vp_2d, p1_2d, p2_2d);
    
    [K_trans, RT] = getTransMatrix(theta, phi, x, y, z, K);
    
    [transVP_3, transP1_3, transP2_3, transP3_3, transP4_3, transP5_3,...
    transP6_3, transP7_3, transP8_3, transP9_3, transP10_3, transP11_3,...
    transP12_3, transVP_2, transP1_2, transP2_2, transP3_2, transP4_2, transP5_2,...
    transP6_2, transP7_2, transP8_2, transP9_2, transP10_2, transP11_2,...
    transP12_2] = transPointCoordinates(K_trans, vp_3d, p1_3d,... 
    p2_3d, p3_3d, p4_3d, p5_3d, p6_3d, p7_3d, p8_3d, ...
    p9_3d, p10_3d, p11_3d, p12_3d, z);
    
    
    
    