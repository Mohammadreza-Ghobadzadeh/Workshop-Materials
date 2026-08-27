function idx = projection(x, grid)
% Project a continuous state onto the nearest DP grid point.
idx = zeros(size(x));
for i = 1:numel(x)
    [~, idx(i)] = min(abs(grid - x(i)));
end
end
