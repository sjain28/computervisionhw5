function X = nn(X, net)

    for i = 1:size(net, 2)
        weights = net(i).gain;
        biases = net(i).bias;
        nonlin = net(i).h;
        
        X = weights*X + biases;
        X = nonlin(X);
    end
end