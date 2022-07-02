function [K_trans, RT] = getTransMatrix(theta, phi, x, y, z, K)
% getTransMatrix calculates the camera matrix after transformation
% Inputs: 
% theta: yaw in rad
% phi: pitch in rad
% x, y, z: displacement
% K: original camera matrix
% Outputs:
% K_trans: camera matrix after transformation in dimension 3x4
% RT: rotation matrix ; displacement

    R = [cos(theta)              0         sin(theta);
         -sin(theta) * sin(phi)   cos(phi)  cos(theta) * sin(phi);
         -sin(theta) * cos(phi)  -sin(phi)  cos(theta) * cos(phi)];
    T = [-x; -y; z];
    RT = [R T; 0 0 0 1];
    K_trans = K * RT;