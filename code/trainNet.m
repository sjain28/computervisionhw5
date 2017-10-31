function net = trainNet(x, y, layers, options, checkpointPath, fig)

resetCheckpoint(checkpointPath, {'mat'});
rng(5);
xf = reformatFeatures(x);
net = trainNetwork(xf, y, layers, options);

figure(fig)
plotData(x, y)
title('Training data')
