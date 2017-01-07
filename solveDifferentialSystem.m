% [x, y1, y2] = solveDifferentialSystem(f1, f2, a, b, n, y1a, y2a) -
% funkcja rozwiazujaca dwoch uklad rownan rozniczkowych:
% 
% a <= x <= b
% y1' = f1(x, y1, y2)
% y2' = f2(x, y1, y2)
% y1(a) = y1a
% y2(a) = y2a
%
% uzywajac do tego metody Rungego Kutty rzedu 4 ze wzorem "trzech osmych".
% Funkcja dzieli odcinek [a, b] na n przedzialow i na kazdym stosuje ta
% metode.
%
% Wejscie:
% * f1, f2, a, b, y1a, y2a - parametry opisujace uklad dwoch rownan
% rozniczkowych do rozwiazania (postac ukladu podana powyzej)
% * n - ilosc przedzialow, na jakie ma zostac podzialony przedzial [a, b]
%
% Wyjscie:
% * x - wektor argumentow dlugosci n+1
% * y1, y2 - wektory z rozwiazaniami ukladu rownan rozniczkowych,
% odpowiednio dla funkcji y1 oraz y2. Oba sa dlugosci n+1
%
%
% Autor: Grzegorz Rozdzialik (D4, gr. lab. 2)

function [x, y1, y2] = solveDifferentialSystem(f1, f2, a, b, n, y1a, y2a)
% Przygotowanie wektorow z rozwiazaniami
y1 = zeros(n + 1, 1);
y2 = zeros(n + 1, 1);

% Wpisanie rozwiazania w punkcie a z zagadnienia poczatkowego
y1(1) = y1a;
y2(1) = y2a;

% Podzial odcinka [a, b] na n podprzedzialow
x = linspace(a, b, n + 1)';

for i=1:n
    % Obliczanie kolejnych wartosci rozwiazan
    [y1(i + 1), y2(i + 1)] = calculateSolutionValue(f1, f2, y1, y2, x, i + 1);
end

end

