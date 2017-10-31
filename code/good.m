function [layers, options] = good(checkpointPath)

layers = [imageInputLayer([1 2]) %  inputs images to a network and applies data normalization
    fullyConnectedLayer(2) % multiplies the input by a weight matrix and then adds a bias vector., 2 = size of output for the fully connected layer
    reluLayer % creates a ReLU layer
    fullyConnectedLayer(2)
    softmaxLayer % makes input to classification layer behave like probabilities (all positive and add up to 1)
    classificationLayer()];

% Learning rate schedule, based on the following relation:
% finalRate = initialRate * factor ^ (epochs/period)
miniBatchSize = 20;
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