function [s,d] = naravni_parameter(b,m)
% NARAVNI_PARAMETER    Naravna parametrizacija Bezierjeve krivulje.
%   NARAVNI_PARAMETER(b,m) vrne vektor ekvidistancnih tock s, ki ustrezajo
%   naravni parametrizaciji Bezierjeve krivulje b, in razdaljo med tockami.
%   Parameter m doloca stevilo korakov in je enak dolzini s.
% 
%   Za izracun dolzine Bezierjeve krivulje NARAVNI_PARAMETER uporablja
%   funkcijo dolzinaBezier na parametrih b in 10*m. Tocke naravne
%   parametrizacije NARAVNI_PARAMETER izracuna tako, da poisce minimum
%   razlike med iskano oddaljenostjo tocke od izhodisca in vrednostjo
%   dolzinaBezier na parametrih b in m, s spremenljivko t. Za to uporablja
%   funkcijo fminsearch.
% 
%   See also DOLZINABEZIER

L = dolzinaBezier(b,10*m);
d = L/(m-1);

s = zeros(m,1);

for i = 2:(m-1)
    
    f = @(t) abs((i-1)*d - dolzinaBezier(b,m,t)); % m v vlogi N
    s(i) = fminbnd(f,0,1);
    
end

s(m) = 1;

end