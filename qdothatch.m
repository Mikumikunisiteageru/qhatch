function qdothatch(X, Y, step, color, size)

% QDOTHATCH hatches polygon(s) with dots.
% Usage: QDOTHATCH(X, Y, STEP)
%     X and Y are coordinate vectors of the polygon to hatch.
%     STEP is the Euclidean distance of adjacent hatch dots.
%     Example:
%         t = linspace(0, 2 * pi, 1000);
%         x = [cos(t), NaN, 2 * cos(t)];
%         y = [sin(t), NaN, -2 * sin(t)];
%         qdothatch(x, y, 0.1);
%         axis([-3, 3, -3, 3])
%         box on;
% Author:
%     Yuchang Yang < deegir@126.com >
%     Institute of Botany, Chinese Academy of Sciences
%     ver. 1, released 20171225. Happy Christmas!

	if nargin < 4 color = 'k'; end
	if nargin < 5 size = 5; end
	wow = pi * exp(1) / 10;
	x = min(X)-wow*step:step:max(X);
	y = min(Y)-wow*step:step:max(Y);
	[xx, yy] = meshgrid(x, y);
	in = inpolygon(xx, yy, X, Y);
	plot(X, Y, '-', 'Color', color);
	ishold_ = ishold;
	hold on
	plot(xx(in), yy(in), '.', 'Color', color, 'MarkerSize', size);
	if ~ishold_ hold off; end
end
