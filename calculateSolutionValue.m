% [y1n, y2n] = calculateSolutionValue(f1, f2, y1, y2, x, n) - funkcja
% obliczajaca wartosci w kolejnych punktach y1n, y2n (dla argumentu x(n))
% dla ukladu dwoch rownan rozniczkowych wykorzystujaca metode Rungego Kutty
% rzedu 4 ze wzorem "trzech osmych".
%
% Wejscie:
% * f1, f2 - funkcje opisujace wzor na pochodne funkcji odpowiednio y1 i y2
% * y1, y2 - wektory zawierajace n-1 poprzednio obliczonych wartosci
% rozwiazania
% * x - wektor argumentow (podzial odcinka [a, b])
% * n - indeks dla ktorego bedzie obliczone rozwiazanie w tym kroku
%
% Wyjscie:
% * y1n, y2n - wartosci rozwiazania w punkcie x(n) odpowiednio dla funkcji
% y1 oraz y2
%
% Autor: Grzegorz Rozdzialik (D4, gr. lab. 2)


function [y1n, y2n] = calculateSolutionValue(f1, f2, y1, y2, x, n)
h = x(2) - x(1);

% Wspolczynniki wzoru "trzech osmych" oraz sam wzor ogolny metody dostepny:
% Fortuna, Macukow, Wasowski "Metody Numeryczne"
a = [0 1/3 2/3 1];
b = [
      0   0  0;
     1/3  0  0;
    -1/3  1  0;
      1  -1  1;
];
w = [1/8 3/8 3/8 1/8];

% Przygotowanie macierzy K (pierwszy wiersz to wektor K dla y1, drugi dla
% y2)
K = zeros(2, 4);
K(1, 1) = h * f1(x(n-1), y1(n-1), y2(n-1));
K(2, 1) = h * f2(x(n-1), y1(n-1), y2(n-1));

for i=2:4
    % Obliczenie sum wystepujacych we wzorze
    sum1 = 0;
    sum2 = 0;
    for j=1:(i-1)
        sum1 = sum1 + b(i, j) * K(1, j);
        sum2 = sum2 + b(i, j) * K(2, j);
    end
    % Obliczenie argumentow funkcji f1 i f2 wystepujacych we wzorze
    nextX = x(n-1) + a(i)*h;
    nextY1 = y1(n-1) + sum1;
    nextY2 = y2(n-1) + sum2;
    
    % Uzupelnienie kolejnych kolumn macierzy K
    K(1, i) = h * f1(nextX, nextY1, nextY2);
    K(2, i) = h * f2(nextX, nextY1, nextY2);
end

% Obliczenie ostatecznego rozwiazania w punkach y1(n), y2(n)
y1n = y1(n-1) + dot(w, K(1, :));
y2n = y2(n-1) + dot(w, K(2, :));

end

