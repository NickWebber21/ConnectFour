function [win] = diagonal_downup_win(gridMatrix,r,c)
% test diagonal down to up 4 in a row (win) 

chipsInRow = 0;
win = 0;
ir = r;
ic = c;

% keep while loop to loop through each 4 places
% while not out of bounds and the chip next to it is the same color

% start at newly placed chip and check up to and to the right first
while (((ir <= 6) && (ic >= 1)) && (gridMatrix(ir,ic) == gridMatrix(r,c))) 
    chipsInRow = chipsInRow + 1;
    if chipsInRow == 4
        win = 1;
        return
    end
    ir = ir + 1;
    ic = ic - 1;
end
% then store all the chips in a row and start at newly placed chip and
% check down and to the left
% skip original chip so that it doesn't count the original chip again
chipsInRow = chipsInRow - 1;
ir = r;
ic = c;
while (((ir >= 1) && (ic <= 7)) && (gridMatrix(ir,ic) == gridMatrix(r,c))) 
    chipsInRow = chipsInRow + 1;
    if chipsInRow == 4
        win = 1;
        return
    end
    ir = ir - 1;
    ic = ic + 1;
end




end

