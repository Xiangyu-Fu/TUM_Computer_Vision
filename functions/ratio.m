function k = ratio(p1,p2,p3)

    % p1 is one vertex of inner rect, p3 is the out vertex point, p2 lies
    % between p1 and p3
    
    dist_1_3 = pdist([p1;p3],'euclidean');

    dist_1_2 = pdist([p1;p2],'euclidean');

    k = dist_1_2/dist_1_3;

end