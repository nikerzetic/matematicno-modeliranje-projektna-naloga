function u = ukrivljenosti(S,d)
% UKRIVLJENOSTI    Izracuna ukrivljenosti Bezierjeve krivulje.
%   UKRIVLJENOSTI(S) izracuna vektor ukrivljenosti u Bezierjeve krivulje
%   pri naravni parametrizaciji S. Parameter d je razdalja med sosednjima 
%   tockama. Drugi odvod aproksimira s sosednjima tockama na sledec naci:
% 
%       r''(s(i)) = (r(s(i+1)) - 2r(s(i)) + r(s(i-1))) / d^2
% 
%   V krajiscih za predhodnjo ali naslednjo tocko uporabi dvakrat isto
%   tocko. Primer zacetne tocke:
% 
%       r''(s(i)) = (r(s(1)) - 2r(s(0)) + r(s(0))) / d^2

m = size(S,2);
u = zeros(m,1);
u(1) = norm(S(:,2) - 2.*S(:,1) + S(:,1))/d/d;

for i = 2:m-1
    
     u(i) = norm(S(:,i+1) - 2.*S(:,i) + S(:,i-1))/d/d;
     
end

u(m) =  norm(S(:,m) - 2.*S(:,m) + S(:,m-1))/d/d;

end