% Convert an array of feature vectors between sizes [N d] and [1 d 1 N]

function x = reformatFeatures(x)

if ismatrix(x)
    x = reshape(x', [1 1 size(x, 2) size(x, 1)]);
    x = permute(x, [1 3 2 4]);
elseif ndims(x) == 4
    s = size(x);
    if all(s([1 3]) == [1 1])
        x = reshape(x, s([3 4]))';
    else
        error('If the input is 4D it must have size [1 d 1 N]')
    end
else
    error('Input must be a matrix or a 4D array with size [1 d 1 N]')
end