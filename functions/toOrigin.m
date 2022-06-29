function [eye_3d, vp_3d, p1_3d, p2_3d, p3_3d, p4_3d, p5_3d, p6_3d, p7_3d, p8_3d, ...
    p9_3d, p10_3d, p11_3d, p12_3d, p13_3d] = toOrigin(eye_3d, vp_3d, ...
    p1_3d, p2_3d, p3_3d, p4_3d, p5_3d, p6_3d, p7_3d, p8_3d, ...
    p9_3d, p10_3d, p11_3d, p12_3d, p13_3d)

    vp_3d = vp_3d - eye_3d;
    p1_3d = p1_3d - eye_3d;
    p2_3d = p2_3d - eye_3d;
    p3_3d = p3_3d - eye_3d;
    p4_3d = p4_3d - eye_3d;
    p5_3d = p5_3d - eye_3d;
    p6_3d = p6_3d - eye_3d;
    p7_3d = p7_3d - eye_3d;
    p8_3d = p8_3d - eye_3d;
    p9_3d = p9_3d - eye_3d;
    p10_3d = p10_3d - eye_3d;
    p11_3d = p11_3d - eye_3d;
    p12_3d = p12_3d - eye_3d;
