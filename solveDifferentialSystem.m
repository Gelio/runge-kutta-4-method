function [x, y1, y2] = solveDifferentialSystem(f1, f2, a, b, n, y1a, y2a)
y1 = zeros(n + 1, 1);
y2 = zeros(n + 1, 1);

y1(1) = y1a;
y2(1) = y2a;

x = linspace(a, b, n + 1)';

for i=1:n
    [y1(n + 1), y2(n + 1)] = calculateSolutionValue(f1, f2, y1, y2, x, n + 1);
end

end

