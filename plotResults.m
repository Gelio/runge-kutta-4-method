% plotResults(x, y1, y2, y1Exact, y2Exact) - funkcja rysujaca wykresy
% wartosci z wektorow y1 oraz y2 (wartosci przyblizone), a takze ich
% wartosci dokladnych (y1Exact, y2Exact) dla argumentow z wektora x.
% Rysowane sa takze wykresu bledu.
%
% Wejscie:
% * x - wektor argumentow
% * y1, y2 - wektory z wartosciami przyblizonymi
% * y1Exact, y2Exact - wektory z wartosciami dokladnymi
% Wszystkie wektory powinny miec taka sama dlugosc.
%
% Wyjscie:
% brak
%
% Autor: Grzegorz Rozdzialik (D4, gr. lab. 2)

function plotResults(x, y1, y2, y1Exact, y2Exact)
figure;
plot(x, y1, x, y1Exact);
title('y1');
legend('y1', 'y1 dokladne');

figure;
plot(x, y2, x, y2Exact);
title('y2');
legend('y2', 'y2 dokladne');

figure;
plot(x, abs(y1 - y1Exact));
title('blad y1');

figure;
plot(x, abs(y2 - y2Exact));
title('blad y2');


end

