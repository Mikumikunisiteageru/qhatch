function qdothatch3(X, Y, step, color, size)

% QDOTHATCH3 hatches polygon(s) with dots in cross beddings.
% Usage: QDOTHATCH3(X, Y, STEP)
%     X and Y are coordinate vectors of the polygon to hatch.
%     STEP is the Euclidean distance of adjacent hatch dots.
%     Example:
%         t = linspace(0, 2 * pi, 1000);
%         x = [cos(t), NaN, 2 * cos(t)];
%         y = [sin(t), NaN, -2 * sin(t)];
%         qdothatch3(x, y, 0.1);
%         axis([-3, 3, -3, 3])
%         box on;
% Author:
%     Yuchang Yang < deegir@126.com >
%     Institute of Botany, Chinese Academy of Sciences
%     ver. 1, released 20171226.

	if nargin < 4 color = 'k'; end
	if nargin < 5 size = 5; end
	wow = pi * exp(1) / 10;
	M = [1, -1/2; 0, 1];
	Minv = [1, 1/2; 0, 1];
	[X_, Y_] = qrotate(M, X, Y);
	x_ = min(X_)-wow*step:step:max(X_);
	y_ = min(Y_)-wow*step:step:max(Y_);
	[xx_, yy_] = meshgrid(x_, y_);
	in = inpolygon(xx_, yy_, X_, Y_);
	[xx, yy] = qrotate(Minv, xx_(in), yy_(in));
	plot(X, Y, '-', 'Color', color);
	ishold_ = ishold;
	hold on
	plot(xx, yy, '.', 'Color', color, 'MarkerSize', size);
	if ~ishold_ hold off; end
end

function [xo, yo] = qrotate(M, xi, yi);
% Coordinate rotation
	new = [xi(:), yi(:)] * M;
	xo = new(:, 1);
	yo = new(:, 2);
end
