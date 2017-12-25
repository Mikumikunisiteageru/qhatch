
% An simple example for QHATCH and QDOTHATCH
% 20171225

h = 233;
t = linspace(0, 2 * pi, 2 * h - 1);
x0 = [2 * cos(t), NaN, 1.8 * cos(t(end:-1:1)), NaN, 1.2, 0, -1.2, 0, 1.2, NaN, 1, 0, -1, 0, 1];
y0 = [sin(t), NaN, 0.9 * sin(t(end:-1:1)), NaN, 0, -0.6, 0, 0.6, 0, NaN, 0, -0.5, 0, 0.5, 0];
x1 = [1.8 * cos(t), NaN, 1.2, 0, -1.2, 0, 1.2];
y1 = [0.9 * sin(t), NaN, 0, -0.6, 0, 0.6, 0];
x2 = [2 * cos(t(h:end)), 2 * cos(t(end:-1:h)), -2, NaN, -1, 0, 1, 0.8, 0, -0.8, -1];
y2 = [sin(t(h:end)), sin(t(end:-1:h)) - 0.2, 0, NaN, 0, 0.5, 0, -0.1, 0.3, -0.1, 0];
x3 = [0, 0, NaN, 0, 0];
y3 = [0.5, 0.3, NaN, -0.6, -0.65];
x4 = [1.8 * cos(t(1:h)), 1.8 * cos(t(h:-1:1)), 1.8, NaN, 1.2, 0, -1.2, -1.2, 0, 1.2, 1.2];
y4 = [0.9 * sin(t(1:h)), 0.9 * sin(t(h:-1:1)) - 0.05, 0, NaN, 0, -0.6, 0, -0.05, -0.65, -0.05, 0];
hold on
qhatch(x0, y0, 135, 0.1)
qdothatch(x1, y1, 0.1);
qhatch(x2, y2, 75, 0.03);
plot(x3, y3, '-k');
qhatch(x4, y4, 75, 0.03);
axis([-2.2, 2.2, -1.5, 1.5]);
axis off
set(gca, 'Position', [0.03, 0.03, 0.94, 0.94])
