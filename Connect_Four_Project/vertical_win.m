function [win] = vertical_win(gridMatrix,r,c)
% test vertical 4 in a row (win) 

chipsInRow = 0;
win = 0;
i = r;

% keep while loop to loop through each 4 places up and down
% check vertically up
% while not out of bounds and the chip next to it is the same color
while ((i >= 1) && (gridMatrix(i,c) == gridMatrix(r,c))) 
    chipsInRow = chipsInRow + 1;
    if chipsInRow == 4
        win = 1;
        return
    end
    i = i - 1;
end

% check vertically below
i = r+1;
while ((i <= 6) && (gridMatrix(i,c) == gridMatrix(r,c))) % make sure not out of bounds
    chipsInRow = chipsInRow + 1;
    if chipsInRow == 4
        win = 1;
        return
    end
    i = i + 1;
end




end

