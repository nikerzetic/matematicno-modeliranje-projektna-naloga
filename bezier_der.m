function db = bezier_der(b,r)
% BEZIER_DER    Izracuna Bezierjeve krivulje.
%  BEZIER_DER vrne kontrolne tocke db, ki dolocajo r-ti odvod Bezierjeve
%  krivulje b.
% 
%  See also deCasteljau, diff

db = b;
for i = 1:r
    db = (length(db)-1) * diff(db,1,2);
end

end