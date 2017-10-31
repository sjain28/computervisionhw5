function [layers, options] = bad(checkpointPath)

layers = [imageInputLayer([1 2])
    fullyConnectedLayer(2)
    reluLayer
    fullyConnectedLayer(2)
    softmaxLayer
    classificationLayer()];

% Learning rate schedule, based on the following relation:
% finalRate = initialRate * factor ^ (epochs/period)
miniBatchSize = 100;
initialRate = 0.0001;
finalRate = initialRate;
epochs = 20;
dropFactor = 1;
if initialRate <= finalRate
    dropPeriod = epochs;
else
    dropPeriod = round(epochs * log(dropFactor) / log(finalRate/initialRate));
end

options = trainingOptions('sgdm', 'MaxEpochs', epochs, ...
    'MiniBatchSize', miniBatchSize, ...
    'InitialLearnRate', initialRate, 'LearnRateSchedule', 'piecewise', ...
    'LearnRateDropFactor', dropFactor, 'LearnRateDropPeriod', dropPeriod, ...
    'CheckpointPath', checkpointPath);