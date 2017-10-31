if ~exist('data.m', 'file')
    addpath('./data')
end

load data

figure(1)
plotData(xTest, yTest)
title('Test data')

[layers, options] = good(checkpointPath);

net = trainNet(xTrain, yTrain, layers, options, checkpointPath, 2);
accuracy = testNet(net, xTest, yTest, 3);
fprintf('The testing accuracy of the trained net is %g percent\n', accuracy);

aVal = checkpointAccuracy(checkpointPath, xVal, @classify, yVal);

figure(4)
set(gcf, 'Name', 'Validation accuracy versus training epoch')
clf
plot(aVal)
fsz = 16;
xlabel('Epoch', 'FontSize', fsz)
ylabel('Accuracy', 'FontSize', fsz)
set(gca, 'FontSize', fsz)
