function totTable = colocalizeCount(table1, table2, stainingNames, distThr)

        D = pdist2([table1.x table1.y],[table2.x table2.y], 'euclidean');
        D(D>distThr) = nan;
        [m, in] = min(D, [],'omitnan');


        colocalized_1 = table1(in(~isnan(m)), :);
        colocalized_2 = table2(~isnan(m), :);
        notColocalized_1 = table1(setdiff(1:height(table1),in(~isnan(m))), :);
        notColocalized_2 = table2(isnan(m), :);
        temp1 = vertcat(colocalized_1, notColocalized_1);
        temp2 = vertcat(colocalized_2, notColocalized_2);

        num_col = height(colocalized_1);
        num_1 = height(notColocalized_1);
        num_2 = height(notColocalized_2);

        totcells = num_col+num_2+num_1;
        additionalVars1 = removevars(table1,{'x', 'y'}).Properties.VariableNames;
        additionalVars2 = removevars(table2,{'x', 'y'}).Properties.VariableNames;
        totTable =  table('size', [totcells, 2+length(additionalVars1)+length(additionalVars2)], ...
            'VariableTypes', [{'doublenan', 'doublenan'}, repmat({'double'},1,length(additionalVars1)+length(additionalVars2))], ...
            'VariableNames',[{ 'x', 'y'},additionalVars1, additionalVars2]);
%         
%         totTable{:, additionalVars1} = zeros(totcells,length(additionalVars1));
%         totTable{:, additionalVars2} = zeros(totcells,length(additionalVars2));
        totTable{1:height(temp1), additionalVars1} = temp1{:,additionalVars1};
        totTable{1:height(temp2), additionalVars2} = temp2{:,additionalVars2};

        totTable{:, stainingNames} = nan;


        avgX = round(mean([colocalized_1.x, colocalized_2.x],2));
        avgY = round(mean([colocalized_1.y, colocalized_2.y],2));
        totTable.x(1:num_col) = avgX;
        totTable.y(1:num_col) = avgY;
        totTable{1:num_col, stainingNames(1)} = ones(num_col,1);
        totTable{1:num_col, stainingNames(2)} = ones(num_col,1);
        
        endStain = num_col+num_1;
        totTable{num_col+1:endStain, stainingNames(1)} = ones(num_1, 1);
        totTable{num_col+1:endStain, stainingNames(2)} = zeros(num_1, 1);
        totTable{num_col+1:endStain, {'x','y'}} = notColocalized_1{:, {'x','y'}};

        totTable{endStain+1:totcells, stainingNames(1)} = zeros(num_2, 1);
        totTable{endStain+1:totcells, stainingNames(2)} = ones(num_2, 1);        
        totTable{endStain+1:totcells, {'x','y'}} = notColocalized_2{:, {'x','y'}};














end