% This function transfer 2D coor of 13 points to 3D coor


function [vp_3d, p7_3d, p8_3d, p1_3d, p2_3d, p11_3d,...
    p10_3d, p4_3d, p5_3d, p9_3d, p3_3d, p12_3d, p6_3d] = get3D(...
    vp, p7, p8, p1, p2, p11, p10, p4, p5, p9, p3, p12, p6,lmargin,rmargin)

    p1_3d = [0,0,0];
    p2_3d = [1,0,0];
    p7_3d = [0,1,0];
    p8_3d = [1,1,0];

    norm_ratio_x = 1/pdist([p1;p2],'euclidean');
    norm_ratio_y = 1/pdist([p1;p7],'euclidean');

    vp_x = pdist([ vp(1); p1(1)],'euclidean') * norm_ratio_x;
    vp_y = pdist([ vp(2); p1(2)],'euclidean') * norm_ratio_y;
    vp_3d = [vp_x, vp_y, 0];


    if(rmargin>0)
        p5_3d = [0,0,1];
        p11_3d = [0,1,1];

        ratio_p3 = ratio(p1,p3,p5);
        p3_3d = [0,0,ratio_p3];
        p4_3d = [1,0,ratio_p3];

        ratio_p6 = ratio(p2,p6,p4);
        p6_3d = [1,0,ratio_p6];
        p12_3d = [1,1,ratio_p6];

        ratio_p9 = ratio(p7,p9,p11);
        p9_3d = [0,1,ratio_p9];
        p10_3d = [1,1,ratio_p9];


    else
        p4_3d = [1,0,1];
        p10_3d = [1,1,1];

        ratio_p6 = ratio(p2,p6,p4);
        p6_3d = [1,0,ratio_p6];
        p5_3d = [0,0,ratio_p6];

        ratio_p3 = ratio(p1,p3,p5);
        p3_3d = [0,0,ratio_p3];
        p9_3d = [0,1,ratio_p3];

        ratio_p12 = ratio(p8,p12,p10);
        p12_3d = [1,1,ratio_p12];
        p11_3d = [0,1,ratio_p12];

    end

end