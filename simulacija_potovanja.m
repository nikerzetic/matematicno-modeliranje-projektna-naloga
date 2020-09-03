function simulacija_potovanja(b,m,zanka,hitrost)
% SIMULACIJA_POTOVANJA    Simulacija potovanja tocke po Bezierjevi krivulji.
%   SIMULACIJA_POTOVANJA(b,m,zanka) simulira potovanje tocke po Bezierjevi
%   krivulji b stopnje n. Tocka po krivulji potuje v m enako dolgih korakih.
%   Vzporedno s tem program izrisuje ukrivljenost krivulje. Parameter zanka
%   doloca, ali se animacija ponavlja. Privzeto je parameter zanka nastavljen
%   na false, parameter m pa na 100. Zanko prekinemo z ukazom Ctrl + C v
%   konzoli.
% 
%   Argument hitrost doloca, kako hitro se tocka premika po krivulji.
%   Predstavlja cas med izrisom vsake slicice. Privzeto je nastavljena na 0.01.
% 
%   See also NARAVNI_PARAMETER, PLOTBEZIER, DOLZINABEZIER, DECASTELJAU

if nargin < 4
    hitrost = 0.01;
    if nargin < 3
        zanka = false;
    end
        if nargin < 2
            m = 100;
        end
end

% Potrebna funkcija za izracun tock pri naravni parametrizaciji
s = naravni_parameter(b,m);
S = [b(:,1) zeros(2,m-2) b(:,end)];
for i = 2:(m-1)
    S(:,i) = deCasteljau(b,s(i));
end

for i = 1:m
    hold off;
    plotBezier(b);
    hold on;
    scatter(S(1,i),S(2,i));
    pause(hitrost);
end

while zanka
    for i = 1:m
        hold off;
        plotBezier(b);
        hold on;
        scatter(S(1,i),S(2,i));
        pause(hitrost);
    end
end

end