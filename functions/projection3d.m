function projection3d(app)
    img_front = app.RealWall;   
    img_left = app.fixedLeftWall;  
    img_right = app.fixedRightWall;
    img_up = app.fixedCeil;
    img_down = app.fixedFloor;
    

    xImage_f = [0 1; 0 1];   % The x data for the image corners
    yImage_f = [0 0; 0 0];             % The y data for the image corners
    zImage_f = [1 1; 0 0];   % The z data for the image corners

    surf(xImage_f,yImage_f,zImage_f,...    % Plot the surface
        'CData',img_front,...
        'FaceColor','texturemap','Parent', app.UIAxes_4);

    hold(app.UIAxes_4, 'on' );

    xImage_l = [0 0; 0 0];   % The x data for the image corners
    yImage_l = [-1 0; -1 0];             % The y data for the image corners
    zImage_l = [1 1; 0 0];   % The z data for the image corners
    surf(xImage_l,yImage_l,zImage_l,...    % Plot the surface
        'CData',img_left,...
        'FaceColor','texturemap','Parent', app.UIAxes_4);
    xImage_r = [1 1; 1 1];   % The x data for the image corners
    yImage_r = [0 -1; 0 -1];             % The y data for the image corners
    zImage_r = [1 1; 0 0];   % The z data for the image corners
    surf(xImage_r,yImage_r,zImage_r,...    % Plot the surface
        'CData',img_right,...
        'FaceColor','texturemap','Parent', app.UIAxes_4);

    xImage_u = [0 1; 0 1];   % The x data for the image corners
    yImage_u = [-1 -1; 0 0];             % The y data for the image corners
    zImage_u = [1 1; 1 1];   % The z data for the image corners
    surf(xImage_u,yImage_u,zImage_u,...    % Plot the surface
        'CData',img_up,...
        'FaceColor','texturemap','Parent', app.UIAxes_4);


    xImage_d = [0 1; 0 1];   % The x data for the image corners
    yImage_d = [0 0; -1 -1];             % The y data for the image corners
    zImage_d= [0 0; 0 0];   % The z data for the image corners
    surf(xImage_d,yImage_d,zImage_d,...    % Plot the surface
        'CData',img_down,...
        'FaceColor','texturemap','Parent', app.UIAxes_4);



    %campos and cfamtarget need to be configured
    %set(gca,'Projection','perspective')

    hold(app.UIAxes_4, 'off' );

    % 
%     xlim([0 1])
%     ylim([-1.5 1.5])
%     zlim([0 1])

%     xlabel('x');
%     ylabel('y');
%     zlabel('z');

%     camtarget([0.5,0,0.5], 'Parent', app.UIAxes_4)
%     campos([0.5 -1 0.5], 'Parent', app.UIAxes_4)

%     for y = -5:0.1:-1
%         campos([0.5 y 0.5])
%         drawnow
%     end

end