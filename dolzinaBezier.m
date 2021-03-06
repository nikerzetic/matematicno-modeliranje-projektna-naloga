function L = dolzinaBezier(b,N,t0)
% DOLZINABEZIER    Izracuna priblizek dolzine Bezierjeev krivulje.
%   DOLZINABEZIER(b,N) izracuna dolzino Bezierjeve krivluje, podane s
%   kontrolnimi tockami b tako, da izracuna vrednost Bezierjeve krivulje v N
%   tockah in vrne razdaljo med njimi. Funkcija izracuna dolzino do tocke
%   t0. Ce ni podana, izracuna dolzino celotne krivulje.

if nargin == 3
    p = [b(:,1) zeros(2,N-2) deCasteljau(b,t0)];
elseif nargin < 3
    t0 = 1;
    p = [b(:,1) zeros(2,N-2) b(:,end)];
end

t = 0:(t0/(N-1)):t0;

for i = 2:N-1
    p(:,i) = deCasteljau(b,t(i));
end

p = diff(p,1,2); %[dx; dy]

L = 0;

for i = 1:N-1
    L = L + norm(p(:,i));
end
end