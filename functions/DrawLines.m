function DrawLines(app)
    rx = app.rx;
    ry = app.ry;
    irx = app.irx;
    iry = app.iry;
    vx = app.VanishingPoint(1);
    vy = app.VanishingPoint(2);
    
    % find where the line from VP thru inner rectangle hits the edge of image
    [ox,oy] = find_corner(vx,vy,irx(1),iry(1),0,0);
    orx(1) = ox;  ory(1) = oy;
    [ox,oy] = find_corner(vx,vy,irx(2),iry(2),app.x_limit,0);
    orx(2) = ox;  ory(2) = oy;
    [ox,oy] = find_corner(vx,vy,irx(3),iry(3),app.x_limit,app.y_limit);
    orx(3) = ox;  ory(3) = oy;
    [ox,oy] = find_corner(vx,vy,irx(4),iry(4),0,app.y_limit);
    orx(4) = ox;  ory(4) = oy;
    orx = round(orx);
    ory = round(ory);
    
    % draw everything
    irx = round([rx(1) rx(2) rx(2) rx(1) rx(1)]);
    iry =  round([ry(1) ry(1) ry(2) ry(2) ry(1)]);    
    plot(irx,iry,'b','Parent', app.UIAxes_3); 
    hold(app.UIAxes_2, 'on' );
    plot([vx irx(1)], [vy iry(1)], 'r-.','Parent', app.UIAxes_3);
    plot([orx(1) irx(1)], [ory(1) iry(1)], 'r','Parent', app.UIAxes_3);
    plot([vx irx(2)], [vy iry(2)], 'r-.','Parent', app.UIAxes_3);
    plot([orx(2) irx(2)], [ory(2) iry(2)], 'r','Parent', app.UIAxes_3);
    plot([vx irx(3)], [vy iry(3)], 'r-.','Parent', app.UIAxes_3);
    plot([orx(3) irx(3)], [ory(3) iry(3)], 'r','Parent', app.UIAxes_3);
    plot([vx irx(4)], [vy iry(4)], 'r-.','Parent', app.UIAxes_3);
    plot([orx(4) irx(4)], [ory(4) iry(4)], 'r','Parent', app.UIAxes_3);
    hold(app.UIAxes_3, 'off' );
end