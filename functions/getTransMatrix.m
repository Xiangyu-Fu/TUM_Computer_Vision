function [K_trans, RT] = getTransMatrix(theta, phi, x, y, z, K)
    R = [cos(theta)              0         sin(theta);
         sin(theta) * sin(phi)   cos(phi)  -cos(theta) * sin(phi);
         -sin(theta) * cos(phi)  sin(phi)  cos(theta) * cos(phi)];
    T = [x; y; z];
    RT = [R T; 0 0 0 1];
    K_trans = K * RT;