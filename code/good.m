function [layers, options] = good(checkpointPath)

layers = [imageInputLayer([1 2]) 
    fullyConnectedLayer(12) 
    reluLayer
    fullyConnectedLayer(10) 
    reluLayer 
    fullyConnectedLayer(2)
    softmaxLayer 
    classificationLayer()];

% Learning rate schedule, based on the following relation:
% finalRate = initialRate * factor ^ (epochs/period)
miniBatchSize = 15;
initialRate = 0.1;
finalRate = initialRate/10;
epochs = 130;
dropFactor = .8;
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