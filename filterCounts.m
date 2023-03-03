function celltable = filterCounts(celltable, threshold, verbose)

arguments
celltable table
threshold double {mustBeInRange(threshold, 0,1)}
verbose logical = true
end

% Select rows with score less than THRESHOLD and remove them
rowsToRemove = celltable.rescore <= threshold;
celltable(rowsToRemove,:) = [];
if verbose
fprintf('removed %u rows... \n', sum(rowsToRemove))
end

end