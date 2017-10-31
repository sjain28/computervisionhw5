function resetCheckpoint(cPath, ext)

if ~exist(cPath, 'file')
    [status, msg] = mkdir(cPath);
    if ~status
        error('Could not create directory %s:\n%s', ...
            cPath, msg)
    end
end

for e = 1:length(ext)
    delete([cPath filesep '*.', ext{e}])
end