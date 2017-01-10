% Ten plik zawiera przykladowe zagadnienia poczatkowe i rozwiazania ich
% rozwiazniania. Mozna je wykorzystac wklejajac do testScript.m

% * Przyklad 1 *
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


% * Przyklad 2 *
% Zagadnienie poczatkowe
f1 = @(x, y1, y2)(y1 + y2 + x);
f2 = @(x, y1, y2)(3 * y1 - y2 + 2 * x);
a = 0;
b = 5;
y1a = 5;
y2a = 4;
% Rozwiazanie ukladu rownan rozniczkowych
y1Solution = @(x)((-12 .* x + 3 * exp(-2 .* x) + 81 * exp(2 * x) - 4) / 16);
y2Solution = @(x)((exp(-2 * x) / 16 .* (-4 * exp(2 * x) .* (x + 2) + 81 * exp(4 * x) - 9)));


% * Przyklad 3 *
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