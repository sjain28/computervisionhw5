function a = checkpointAccuracy(checkpointPath, x, classifier, ytrue)

fprintf('Computing validation accuracy versus training epoch\n');

net = checkpointNets(checkpointPath, 'convnet_checkpoint__%d');
n = length(net);
a(n) = 0;

xf = reformatFeatures(x);

for e = 1:n
    y = classifier(net{e}, xf);
    a(e) = 100 * nnz(y == ytrue) / numel(ytrue);
end

    function nets = checkpointNets(cPath, format, netName)
        
        if nargin < 3 || isempty(netName)
            netName = 'net';
        end
        
        ckp = dir(cPath);
        nc = length(ckp);
        nets(nc) = cell(1);
        number = zeros(nc, 1);
        
        k = 0;
        for f = 1:nc
            ne = sscanf(ckp(f).name, format);
            if ~isempty(ne)
                k = k + 1;
                load([ckp(f).folder filesep ckp(f).name])
                nets{k} = eval(netName);
                number(k) = ne;
            end
        end
        
        number = number(1:k);
        nets = nets(1:k);
        [~, order] = sort(number);
        nets = nets(order);
        
    end
end