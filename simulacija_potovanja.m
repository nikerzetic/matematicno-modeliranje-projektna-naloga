function simulacija_potovanja(b,m,zanka)
% SIMULACIJA_POTOVANJA    Simulacija potovanja tocke po Bezierjevi krivulji.
%   SIMULACIJA_POTOVANJA(b,m,zanka) simulira potovanje tocke po Bezierjevi
%   krivulji b stopnje n. Tocka po krivulji potuje v m enako dolgih korakih.
%   Vzporedno s tem program izrisuje ukrivljenost krivulje. Parameter zanka
%   doloca, ali se animacija ponavlja. Privzeto je parameter zanka nastavljen
%   na false, parameter m pa na 100. Zanko prekinemo z ukazom Ctrl + C v
%   konzoli.

switch nargin
    case 2
        zanka = false;
    case 1
        m = 100;
end

% Potrebna funkcija za izracun tock pri naravni parametrizaciji
S = nekaj_nekaj_temna_stran

for i = 1:m
    hold off;
    plotBezier(b);
    hold on;
    scatter(S(1,i),S(2,i));
end

while zanka
    for i = 1:m
        hold off;
        plotBezier(b);
        hold on;
        scatter(S(1,i),S(2,i));
    end
end

end