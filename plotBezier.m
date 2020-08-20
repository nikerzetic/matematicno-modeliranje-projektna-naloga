function plotBezier(b)
% PLOTBEZIER    Izrise Bezierjevo krivuljo.
%   PLOTBEZIER(b) izrise Bezierovo krivuljo b. Za izracun
%   tocke na krivulji uporabimo deCasteljauov algoritem.
%   Stolpci matrike b so kontrolne tocke Bezierove krivulje.

T = linspace(0,1);
B = zeros(2,length(T));

for i = 1:length(B)
    B(:,i) = deCasteljau(b,T(i));
end

plot(B(1,:),B(2,:),'k');

end