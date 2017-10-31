function [accuracy, yNet] = testNet(net, x, y, fig, suffix)

if nargin < 5
    suffix = '';
end

xf = reformatFeatures(x);
yNet = classify(net, xf);
accuracy = 100 * nnz(yNet == y) / numel(y);

figure(fig)
set(gcf, 'Name', sprintf('Classification results%s (%.2f%% accurate)', ...
    suffix, accuracy))
plotData(x, yNet)
