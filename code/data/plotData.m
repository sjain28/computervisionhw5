function plotData(x, y)

style = {'or', '+b', 'xg'};
cat = categories(y);
nstyles = length(style);
ncats = length(cat);
if nstyles < ncats
    warning('Using %d styles to display %d categories', nstyles, ncats);
end

cla
hold on
for c = 1:ncats
    which = y == cat{c};
    plot(x(which, 1), x(which, 2), style{mod(c - 1, nstyles) + 1})
end
axis equal
axis tight
axis off
drawnow