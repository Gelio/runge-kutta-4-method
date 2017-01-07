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
% joinPlots - parametr okreslajacy czy wykresy y1 i y2 powinny znalezc
% sie na tym samym wykresie (wartosc 1), czy dwoch roznych (obok siebie,
% wartosc 0)
%
% Wyjscie:
% brak
%
% Autor: Grzegorz Rozdzialik (D4, gr. lab. 2)

function plotResults(x, y1, y2, y1Exact, y2Exact, joinPlots)
blad1 = abs(y1 - y1Exact);
blad2 = abs(y2 - y2Exact);

figure;
if joinPlots == 1
    subplot(1, 2, 1);
    plot(x, y1, '-+', x, y1Exact, x, y2, '-+', x, y2Exact);
    title('Rozwiazania uk³adu równañ ró¿niczkowych');
    legend('y1 obliczone RK4', 'y1 dok³adne', 'y2 obliczone RK4', 'y2 dok³adne');
    
    subplot(1, 2, 2);
    plot(x, blad1, '-+', x, blad2);
    title('Modu³ b³êdów rozwi¹zañ');
    legend('B³¹d dla y1', 'B³¹d dla y2');
else
    subplot(2, 2, 1);
    plot(x, y1, '-+', x, y1Exact);
    title('Rozwi¹zanie y1');
    legend('y1 obliczone RK4', 'y1 dok³adne');

    subplot(2, 2, 2);
    plot(x, y2, '-+', x, y2Exact);
    title('Rozwi¹zanie y2');
    legend('y2 obliczone RK4', 'y2 dok³adne');

    subplot(2, 2, 3);
    plot(x, blad1);
    title('Modu³ b³êdu dla y1');
    legend('B³¹d dla y1');

    subplot(2, 2, 4);
    plot(x, blad2);
    title('Modu³ b³êdu dla y2');
    legend('B³¹d dla y2');
end

end

