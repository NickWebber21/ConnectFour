function [win] = horizontal_win(gridMatrix,r,c)
% test horizontal 4 in a row (win) 

chipsInRow = 0;
win = 0;
i = c;

% keep while loop to loop through each 4 places
% check for right side
% while not out of bounds and the chip next to it is the same color
while ((i <= length(gridMatrix)) && (gridMatrix(r,i) == gridMatrix(r,c))) 
    chipsInRow = chipsInRow + 1;
    if chipsInRow == 4
        win = 1;
        return
    end
    i = i + 1;
end

% check for left side
i = c-1;
while ((i >= 1) && (gridMatrix(r,i) == gridMatrix(r,c))) % make sure not out of bounds
    chipsInRow = chipsInRow + 1;
    if chipsInRow == 4
        win = 1;
        return
    end
    i = i - 1;
end




end

