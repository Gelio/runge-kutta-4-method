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

