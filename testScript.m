f1 = @(x, y1, y2)(3 * exp(x / 2) - y2);
f2 = @(x, y1, y2)(y2);
a = 0;
b = 5;
n = 10;

y1a = 4;
y2a = 3;

y1Solution = @(x)(-exp(-x) + 4 * exp(x / 2) + 1);
y2Solution = @(x)(exp(x) + 2 * exp(x / 2));

[x, y1, y2] = solveDifferentialSystem(f1, f2, a, b, n, y1a, y2a);

y1Exact = y1Solution(x);
y2Exact = y2Solution(x);
plotResults(x, y1, y2, y1Exact, y2Exact);