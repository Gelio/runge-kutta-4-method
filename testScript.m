% Skrypt testujacy metode Rungego Kutta rzedu 4 ze wzorem "trzech osmych".
% Autor: Grzegorz Rozdzialik (D4, gr. lab. 2)

% Uklad dwoch rownan rozniczkowych:
% a <= x <= b
% y1' = f1(x, y1, y2)
% y2' = f2(x, y1, y2)
% y1(a) = y1a
% y2(a) = y2a

% *** Konfiguracja ***
% Zagadnienie poczatkowe
f1 = @(x, y1, y2)(y2);
f2 = @(x, y1, y2)(3 * exp(x / 2) - y2);
a = 0;
b = 10;
y1a = 4;
y2a = 3;

% Rozwiazanie ukladu rownan rozniczkowych
y1Solution = @(x)(-exp(-x) + 4 * exp(x / 2) + 1);
y2Solution = @(x)(exp(-x) + 2 * exp(x / 2));

% Ilosc podprzedzialow odcinka [a, b] (zazwyczaj im wiecej tym lepsza
% dokladnosc)
n = 100;


% *** Koniec konfiguracji ***



% Rozwiazanie ukladu rownan rozniczkowych
[x, y1, y2] = solveDifferentialSystem(f1, f2, a, b, n, y1a, y2a);

% Obliczenie wartosci dokladnych
y1Exact = y1Solution(x);
y2Exact = y2Solution(x);

% Naniesienie danych na wykres
plotResults(x, y1, y2, y1Exact, y2Exact);