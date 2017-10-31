function z = reformatLabels(y)

if iscategorical(y)
    cats = categories(y);
    z = uint32([numel(y), 1]);
    for c = 1:length(cats)
        z(y == cats{c}) = c;
    end
    z = reshape(z, size(y));
else
    z = categorical(y);
end