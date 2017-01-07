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
    title('Rozwiazania uk�adu r�wna� r�niczkowych');
    legend('y1 obliczone RK4', 'y1 dok�adne', 'y2 obliczone RK4', 'y2 dok�adne');
    
    subplot(1, 2, 2);
    plot(x, blad1, '-+', x, blad2);
    title('Modu� b��d�w rozwi�za�');
    legend('B��d dla y1', 'B��d dla y2');
else
    subplot(2, 2, 1);
    plot(x, y1, '-+', x, y1Exact);
    title('Rozwi�zanie y1');
    legend('y1 obliczone RK4', 'y1 dok�adne');

    subplot(2, 2, 2);
    plot(x, y2, '-+', x, y2Exact);
    title('Rozwi�zanie y2');
    legend('y2 obliczone RK4', 'y2 dok�adne');

    subplot(2, 2, 3);
    plot(x, blad1);
    title('Modu� b��du dla y1');
    legend('B��d dla y1');

    subplot(2, 2, 4);
    plot(x, blad2);
    title('Modu� b��du dla y2');
    legend('B��d dla y2');
end

end

