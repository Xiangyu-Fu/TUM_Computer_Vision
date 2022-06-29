function [vp, p7, p8, p1, p2, p11, p10, p4, p5, p9, p3, p12, p6] =...
    recoord(vp, p7, p8, p1, p2, p11, p10, p4, p5, p9, p3, p12, p6, height, width)


    % conver coordinates, vp at 0,0, normalize between 0 and 1

    p1(1) = (p1(1)-vp(1))/width;
    p1(2) = -(p1(2)-vp(2))/height;

    p2(1) = (p2(1)-vp(1))/width;
    p2(2) = -(p2(2)-vp(2))/height;

    p3(1) = (p3(1)-vp(1))/width;
    p3(2) = -(p3(2)-vp(2))/height;

    p4(1) = (p4(1)-vp(1))/width;
    p4(2) = -(p4(2)-vp(2))/height;

    p5(1) = (p5(1)-vp(1))/width;
    p5(2) = -(p5(2)-vp(2))/height;

    p6(1) = (p6(1)-vp(1))/width;
    p6(2) = -(p6(2)-vp(2))/height;

    p7(1) = (p7(1)-vp(1))/width;
    p7(2) = -(p7(2)-vp(2))/height;

    p8(1) = (p8(1)-vp(1))/width;
    p8(2) = -(p8(2)-vp(2))/height;

    p9(1) = (p9(1)-vp(1))/width;
    p9(2) = -(p9(2)-vp(2))/height;

    p10(1) = (p10(1)-vp(1))/width;
    p10(2) = -(p10(2)-vp(2))/height;

    p11(1) = (p11(1)-vp(1))/width;
    p11(2) = -(p11(2)-vp(2))/height;

    p12(1) = (p12(1)-vp(1))/width;
    p12(2) = -(p12(2)-vp(2))/height;

    vp(1) = 0;
    vp(2) = 0;


end