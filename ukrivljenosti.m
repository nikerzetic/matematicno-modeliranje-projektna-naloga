function u = ukrivljenosti(s,b,d)
% UKRIVLJENOSTI    Izracuna ukrivljenosti Bezierjeve krivulje.
%   UKRIVLJENOSTI(S) izracuna vektor ukrivljenosti u Bezierjeve krivulje b
%   pri naravni parametrizaciji S. Parameter d je razdalja med sosednjima 
%   tockama. Drugi odvod aproksimira s sosednjima tockama na sledec naci:
% 
%       r''(s(i)) = (r(s(i)+h) - 2r(s(i)) + r(s(i)-h)) / h^2
% 
%   V krajiscih privzamemo, da je odvod enak kot v sosednji tocki. Pri tem 
%   je h enak d/1000.

m = length(s);
u = zeros(m,1);
h = d/1000;

for i = 2:m-1
     u(i) = norm(deCasteljau(b,s(i)+h) - 2*deCasteljau(b,s(i)) + deCasteljau(b,s(i)-h))/h/h;
end

u(1) = u(2);
u(m) =  u(m-1);

end