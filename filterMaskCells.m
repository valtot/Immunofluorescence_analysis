function filteredCellTable = filterMaskCells(celltable, mask)

    celltable = array2table(round(celltable{:,:}));

    celltable(celltable{:,1}>size(mask,2),:) = {size(mask,2)};
    celltable(celltable{:,2}>size(mask,1),:) = {size(mask,1)};

    celltable((celltable{:,2}>=size(mask, 1)-1),1) = {size(mask, 1)-1};
    celltable((celltable{:,1}>=size(mask, 2)-1),2) = {size(mask, 2)-1};
    
    validcells = sub2ind(size(mask),celltable{:,2}, celltable{:,1});
    cells = mask(validcells);
    filteredCellTable = celltable(cells,:);
    filteredCellTable = renamevars(filteredCellTable, ["Var1", "Var2"],["x","y"]);


end