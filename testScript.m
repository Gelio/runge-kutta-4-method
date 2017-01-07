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
f1 = @(x, y1, y2)(y2 + cos(x));
f2 = @(x, y1, y2)(-y1 + x);
a = 0;
b = 5;
y1a = 1;
y2a = 2;


% Rozwiazanie ukladu rownan rozniczkowych
y1Solution = @(x)(x + 3 * sin(x) / 2 + (x + 2) .* cos(x) / 2);
y2Solution = @(x)(-1/2 * (x + 2) .* sin(x) + cos(x) + 1);

% Ilosc podprzedzialow odcinka [a, b] (zazwyczaj im wiecej tym lepsza
% dokladnosc)
n = 100;

% Rozwiazanie y1 i y2 na jednym wykresie (1 - oba na jednym, 0 - y1 i y2 na
% oddzielnych wykresach)
joinPlots = 1;


% *** Koniec konfiguracji ***


% Sprawdzenie, czy zagadnienie poczatkowe oraz dokladne rozwiazanie sie
% zgadzaja
delta = 0.1;
if abs(y1Solution(a) - y1a) > delta || abs(y2Solution(a) - y2a) > delta
    error('testScript:wrongSolution', ...
        'Wpisane rozwi¹zanie dok³adne uk³adu równañ nie zgadza siê z zagadnieniem pocz¹tkowym (zbyt du¿a ró¿nica wartoœci w punkcie a)');
end

% Rozwiazanie ukladu rownan rozniczkowych
tic;
[x, y1, y2] = solveDifferentialSystem(f1, f2, a, b, n, y1a, y2a);
timeSpent = toc;

fprintf('Czas rozwi¹zywania zagadnienia pocz¹tkowego: %f ms\n', timeSpent / 1000);

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
fprintf('\n\n');