function imgWithBorder = addBorder(app, img)

    % input img is the origin image, return img with border

    imgWithBorder = zeros(app.x_limit, app.y_limit);

    imgWithBorder( app.lmargin: app.x_limit - app.rmargin, app.tmargin: app.y_limit - app.bmargin  ) = img;

end