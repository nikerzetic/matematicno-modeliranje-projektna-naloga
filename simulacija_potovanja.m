function simulacija_potovanja(b,m,naravna_parametrizacija,zanka,hitrost)
% SIMULACIJA_POTOVANJA    Simulacija potovanja tocke po Bezierjevi krivulji.
%   SIMULACIJA_POTOVANJA(b,m,zanka) simulira potovanje tocke po Bezierjevi
%   krivulji b stopnje n. Tocka po krivulji potuje v m enako dolgih korakih.
%   Vzporedno s tem program izrisuje ukrivljenost krivulje. Parameter zanka
%   doloca, ali se animacija ponavlja, naravna_parametrizacija ali 
%   parametriziramo z naravno parametrizacijo. Privzeto sta parametra zanka
%   in naravna_parametrizacija nastavljena na false, parameter m pa na 100. 
%   Zanko prekinemo z ukazom Ctrl + C v konzoli.
% 
%   Argument hitrost doloca, kako hitro se tocka premika po krivulji.
%   Predstavlja cas med izrisom vsake slicice. Privzeto je nastavljena na 0.01.
% 
%   See also NARAVNI_PARAMETER, PLOTBEZIER, DOLZINABEZIER, DECASTELJAU

if nargin < 5
    hitrost = 0.01;
    if nargin < 4
        zanka = false;
        if nargin < 3
            naravna_parametrizacija = false;
            if nargin < 2
                m = 100;
            end
        end
    end
end

s = 0;

if naravna_parametrizacija
    [s,d] = naravni_parameter(b,m);
    S = [b(:,1) zeros(2,m-2) b(:,end)];
    for i = 2:(m-1)
        S(:,i) = deCasteljau(b,s(i));
    end
    u = ukrivljenosti(s,b,d);
else
    s = 0:(1/(m-1)):1;
    S = [b(:,1) zeros(2,m-2) b(:,end)];
    u = zeros(1,m);
    db = bezier_der(b,1);
    ddb = bezier_der(b,2);
    for i = 2:(m-1)
        S(:,i) = deCasteljau(b,s(i));
        dbi = [deCasteljau(db,s(i));0];
        ddbi = [deCasteljau(ddb,s(i));0];
        u(i) = norm(cross(dbi,ddbi),1)/(norm(dbi)^3);
    end
end

figure;
for i = 1:m
    % Levi zaslon
    subplot(1,2,1);
    hold off;
    plotBezier(b);
    hold on;
    scatter(S(1,i),S(2,i));
    
    % Desni zaslon
    subplot(1,2,2);
    hold off;
    plot(s,u,'k');
    hold on;
    scatter(s(i),u(i));
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