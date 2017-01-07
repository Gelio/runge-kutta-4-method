% Skrypt testujacy metode Rungego Kutta rzedu 4 ze wzorem "trzech osmych".
% Wyswietla rozwiazania ukladu dwoch rownan rozniczkowych na wykresie (lub
% wykresach), tablicujac rowniez blad.
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
n = 10;

% Rozwiazanie y1 i y2 na jednym wykresie (1 - oba na jednym, 0 - y1 i y2 na
% oddzielnych wykresach)
joinPlots = 0;


% *** Koniec konfiguracji ***


% Sprawdzenie, czy zagadnienie poczatkowe oraz dokladne rozwiazanie sie
% zgadzaja
delta = 0.1;
if abs(y1Solution(a) - y1a) > delta || abs(y2Solution(a) - y2a) > delta
    error('testScript:wrongSolution', ...
        'Wpisane rozwi¹zanie dok³adne uk³adu równañ nie zgadza siê z zagadnieniem pocz¹tkowym (zbyt du¿a ró¿nica wartoœci w punkcie a)');
end

% Rozwiazanie ukladu rownan rozniczkowych
[x, y1, y2] = solveDifferentialSystem(f1, f2, a, b, n, y1a, y2a);

% Obliczenie wartosci dokladnych
y1Exact = y1Solution(x);
y2Exact = y2Solution(x);

% Naniesienie danych na wykres
plotResults(x, y1, y2, y1Exact, y2Exact, joinPlots);

% Stablicowanie bledu
errorY1 = abs(y1 - y1Exact);
errorY2 = abs(y2 - y2Exact);
fprintf('Maksymalny modu³ b³êdu miêdzy rozwi¹zaniem dok³adnym a obliczonym metod¹:\n');
fprintf('* dla y1: %e\n', max(errorY1));
fprintf('* dla y2: %e\n', max(errorY2));