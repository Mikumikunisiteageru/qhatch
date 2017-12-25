function qhatch(X, Y, angle, step, color)

% QHATCH hatches polygon(s) in vector lines rather than in bitmap.
% Usage: QHATCH(X, Y, ANGLE, STEP)
%     X and Y are coordinate vectors of the polygon to hatch.
%     ANGLE is the polar angle of hatch lines, where 
%         ANGLE = 0 uses horizontal lines, 
%         ANGLE = 90 uses vertical lines,
%         and so on.
%     STEP is the Euclidean distance of adjacent hatch lines.
%     Example:
%         t = linspace(0, 2 * pi, 1000);
%         x = [cos(t), NaN, 2 * cos(t)];
%         y = [sin(t), NaN, 2 * sin(t)];
%         qhatch(x, y, 60, 0.1);
%         axis([-3, 3, -3, 3])
%         box on;
% Author:
%     Yuchang Yang < deegir@126.com >
%     Institute of Botany, Chinese Academy of Sciences
%     ver. 1, released 20171225. Happy Christmas!

	if nargin < 5 color = 'k'; end
	cos_ = cos(angle * pi / 180);
	sin_ = sin(angle * pi / 180);
	M = [sin_, cos_; -cos_, sin_];
	[X_, Y_] = qrotate(M, X, Y);
	yrange_ = quantile(Y_, [0, 1]);
	plot(X, Y, '-', 'Color', color);
	ishold_ = ishold;
	hold on
	for xs_ = min(X_)-step*pi*exp(1)/10:step:max(X_)
		[xi_, yi_] = polyxpoly(X_, Y_, xs_ * [1, 1], yrange_);
		[xi, yi] = qrotate(M', xi_, sort(yi_));
		match = @(vec) reshape(vec, 2, []);
		plot(match(xi), match(yi), '-', 'Color', color)
	end
	if ~ishold_ hold off; end
end

function [xo, yo] = qrotate(M, xi, yi);
% Coordinate rotation
	new = [xi(:), yi(:)] * M;
	xo = new(:, 1);
	yo = new(:, 2);
end
