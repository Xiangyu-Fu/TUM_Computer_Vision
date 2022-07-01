% This function transfer 2D coor of 13 points to 3D coor


function [vp_3d, p7_3d, p8_3d, p1_3d, p2_3d, p11_3d,...
    p10_3d, p4_3d, p5_3d, p9_3d, p3_3d, p12_3d, p6_3d, eyep] = get3D(...
    vp, p7, p8, p1, p2, p11, p10, p4, p5, p9, p3, p12, p6,height, width)




    [vp, p7, p8, p1, p2, p11, p10, p4, p5, p9, p3, p12, p6] =...
    recoord(vp, p7, p8, p1, p2, p11, p10, p4, p5, p9, p3, p12, p6, height, width);


    eyep = [vp(1), vp(2), 0];

    p1_3d = trans_p1_6(p1, eyep);
    p2_3d = trans_p1_6(p2, eyep);
    p3_3d = trans_p1_6(p3, eyep);
    p4_3d = trans_p1_6(p4, eyep);
    p5_3d = trans_p1_6(p5, eyep);
    p6_3d = trans_p1_6(p6, eyep);

    vp_3d = [vp(1), vp(2), p1_3d(3)];

    height = ( p7(2) - p1(2) ) /  (-1) * ( p1_3d(3) );

    p7_3d(1) = p1_3d(1);
    p8_3d(1) = p2_3d(1);
    p7_3d(2) = height - 1;
    p8_3d(2) = height - 1;
    p7_3d(3) = p1_3d(3);
    p8_3d(3) = p2_3d(3);


    p9_3d = trans_p9_12(p9, eyep, height);
    p10_3d = trans_p9_12(p10, eyep, height);
    p11_3d = trans_p9_12(p11, eyep, height);
    p12_3d = trans_p9_12(p12, eyep, height);


%     oevminx=0.0,oevmaxx=0.0,oevminy=0.0,oevmaxy=0.0,oevdiffx,oevdiffy;
% 
%     p_3d = [p1_3d, p2_3d, p3_3d, p4_3d, p5_3d, p6_3d,...
%         p7_3d, p8_3d, p9_3d, p10_3d, p11_3d, p12_3d];
% 
%     p = [p1, p2, p3, p4, p5, p6,...
%         p7, p8, p9, p10, p11, p12];


end


function p_3d = trans_p1_6(p, eyep)


    p_3d = [0 0 0];

    grad = - ( 1 + eyep(2) ) /( p(2) - eyep(2) );

    p_3d(1) = grad * ( p(1) - eyep(1) ) + eyep(1);
    p_3d(3) = grad * ( -1 - eyep(3) ) + eyep(3);
    p_3d(2) = -1;

end

function p_3d = trans_p9_12(p, eyep, height)

    p_3d = [0 0 0];
    
    grad = ( height - eyep(2) -1 ) / ( p(2) - eyep(2) );
    p_3d(1) = grad * ( p(1) - eyep(1) ) + eyep(1);
    p_3d(2) = height - 1;
    p_3d(3) = grad * ( -1 - eyep(3) ) + eyep(3);


end


