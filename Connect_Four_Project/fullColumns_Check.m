function [fullColumns] = fullColumns_Check(gridMatrix)
% check to see if all columns are full 

% initiate fullColumns as full and if they aren't return 0
fullColumns = 1;

% loop through each position in grid and if any positions at all equal the 
% default placeholder (1) then return 0 to fullColumns as false
for c=1:7
    for r=1:6
        if gridMatrix(r,c) == 1
            fullColumns = 0;
            return
        end
    end
end



end