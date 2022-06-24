
function [orx,ory] = get4vertices(app)

    vx = app.VanishingPoint(1);
    vy = app.VanishingPoint(2);
    irx = app.irx;
    iry = app.iry;
    
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

end