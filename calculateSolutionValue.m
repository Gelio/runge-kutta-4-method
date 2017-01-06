function [y1n, y2n] = calculateSolutionValue(f1, f2, y1, y2, x, n)
h = x(2) - x(1);

% Wspolczynniki wzoru "trzech osmych"
% Fortuna, Macukow, Wasowski "Metody Numeryczne"
a = [0 1/3 2/3 1];
b = [
      0   0  0;
     1/3  0  0;
    -1/3  1  0;
      1  -1  1;
];
w = [1/8 3/8 3/8 1/8];

K = zeros(2, 4);
K(1, 1) = h * f1(x(n-1), y1(n-1), y2(n-1));
K(2, 1) = h * f2(x(n-1), y1(n-1), y2(n-1));

for i=2:4
    sum1 = 0;
    sum2 = 0;
    % Spróbowac uproœciæ
    for j=1:(i-1)
        sum1 = sum1 + b(i, j) * K(1, j);
        sum2 = sum2 + b(i, j) * K(2, j);
    end
    nextX = x(n-1) + a(i)*h;
    nextY1 = y1(n-1) + sum1;
    nextY2 = y2(n-1) + sum2;
    
    K(1, i) = h * f1(nextX, nextY1, nextY2);
    K(2, i) = h * f2(nextX, nextY1, nextY2);
end

y1n = y1(n-1) + dot(w, K(1, :));
y2n = y2(n-1) + dot(w, K(2, :));

end

