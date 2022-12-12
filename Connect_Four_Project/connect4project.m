clear all
clc
% start of code for connect 4

% initialize game engine

my_scn = simpleGameEngine('ConnectFour.png',86,101,1,[255,255,255]);

% create empty array to act as the connect 4 grid (6 rows, 7 columns)

gridMatrix = ones(6,7);

% introduction to connect 4 game and storing users inputted chip color
% red chip is stored as 1 blue chip is stored as 2 

% introduction and rules start
%%%%%%%%

fprintf('Thank you for choosing to play Connect Four, created by future\n')
fprintf('game developers, under the business name group Q\n')
fprintf('\nConnect Four is a two person game, where the objective of the\n')
fprintf('game is to get four chips in a row diagonally, horizontally, or\n')
fprintf('vertically inside of the grid which has 7 columns and 6 rows. The\n')
fprintf('rules are pretty simple, each player gets one turn\n') 
fprintf('after the other to drop their chip from the top of the grid. You\n') 
fprintf('may place your chip wherever you’d like, whether you need to block\n')
fprintf('the other persons four in a row or are about to get your own four\n')
fprintf('in the row, etc… Be creative, and have fun!\n')
fprintf('-------------------------------------------------------------------')

%%%%%%%%
% introduction and rules end

%

% chip color decision start
%%%%%%%%
    
drawScene(my_scn,gridMatrix);
xlabel('Player 1, would you like to use red chips (left click) or black chips (right click)? ')
[~,~,player1Chip] = getMouseInput(my_scn);

% store variable as 2 and 3 instead of 1 since 1 is empty slots
if player1Chip == 1
    player1Chip = player1Chip + 1; 
end

if player1Chip == 2 % if player 1 chose red then assign black to player 2
    player2Chip = 3;
    xlabel('Good choice player 1, you get red chips!')
    drawScene(my_scn,gridMatrix);
    pause(2)
    xlabel('Looks like you got black chips, player 2.')
    drawScene(my_scn,gridMatrix);
    pause(2)
elseif player1Chip == 3 % if player 1 chooses black then assign red to player 2
    player2Chip = 2;
    xlabel('Good choice player 1, you get black chips!')
    drawScene(my_scn,gridMatrix);
    pause(2)
    xlabel('Looks like you got red chips, player 2.')
    drawScene(my_scn,gridMatrix);
    pause(2)
end

%%%%%%%%
% chip color decision end

%

% game starts
%%%%%%%%

% initialize what a win is and a full board
win = 0;
fullColumns = 0;
j = 0;

xlabel('Player 1 you go first...')
drawScene(my_scn,gridMatrix);
pause(1)

while (win ~= 1 && fullColumns ~= 1)

    if (mod(j,2) == 0) % if j is even then its player1's turn if it's odd it's palyer2's.
        % display grid and wait
        xlabel('Player 1 click on the column you would like to place your chip into...');
        drawScene(my_scn,gridMatrix);
        [r,c] = getMouseInput(my_scn);
        for r = 6:-1:1 % for loop to check spot avaliability in row from last row to start
            if gridMatrix(r,c) == 1 % if spot is avaliable replace the 1 with playerchip
                gridMatrix(r,c) = player1Chip;
                drawScene(my_scn,gridMatrix);
                j = j + 1;
                break % break so the chip does not enter each empty column just the one closest  to the bottom
            end
        end

        % check if column is full if it is they try again
        if mod(j,2) == 0
            xlabel('That column was full try again...')
            drawScene(my_scn,gridMatrix);
            pause(1.5)
        end

        % check if board is full if it is the game ends
        if fullColumns_Check(gridMatrix) == 1
            fullColumns = 1;
            xlabel('No winner! The board is full!')
            drawScene(my_scn,gridMatrix);
        end

        %functions to check for wins
        %first check horizontal 
        if horizontal_win(gridMatrix,r,c) == 1
            win = 1;
            xlabel('Congratulations Player 1! You win!!!')
            drawScene(my_scn,gridMatrix);
        elseif vertical_win(gridMatrix,r,c) == 1
            win = 1;
            xlabel('Congratulations Player 1! You win!!!')
            drawScene(my_scn,gridMatrix);
        elseif diagonal_downup_win(gridMatrix,r,c) == 1
            win = 1;
            xlabel('Congratulations Player 1! You win!!!')
            drawScene(my_scn,gridMatrix);
        elseif diagonal_updown_win(gridMatrix,r,c) == 1
            win = 1;
            xlabel('Congratulations Player 1! You win!!!')
            drawScene(my_scn,gridMatrix);
        end
        
    
   
        
    % when it's player 2's turn     
    elseif (mod(j,2) ~= 0)
        xlabel('Player 2 click on the column you would like to place your chip into...');
        drawScene(my_scn,gridMatrix);
        [r,c] = getMouseInput(my_scn);
        for r = 6:-1:1 % for loop to check spot avaliability in row from last row to start
            if gridMatrix(r,c) == 1 % if spot is avaliable replace the 1 with playerchip
                gridMatrix(r,c) = player2Chip;
                drawScene(my_scn,gridMatrix);
                j = j + 1;
                break % break so the chip does not enter each empty column just the one closest  to the bottom
            end
        end

        % check if column is full if it is they try again
        if mod(j,2) == 1
            xlabel('That column was full try again...\n')
            drawScene(my_scn,gridMatrix);
            pause(1.5)
        end

        % check if board is full if it is the game ends
        if fullColumns_Check(gridMatrix) == 1
            fullColumns = 1;
            xlabel('No winner! The board is full!')
            drawScene(my_scn,gridMatrix);
        end

        %functions to check for wins
        %first check horizontal
        if horizontal_win(gridMatrix,r,c) == 1
            win = 1;
            xlabel('Congratulations Player 2! You win!!!')
            drawScene(my_scn,gridMatrix);
        elseif vertical_win(gridMatrix,r,c) == 1
            win = 1;
            xlabel('Congratulations Player 2! You win!!!')
            drawScene(my_scn,gridMatrix);
        elseif diagonal_downup_win(gridMatrix,r,c) == 1
            win = 1;
            xlabel('Congratulations Player 2! You win!!!')
            drawScene(my_scn,gridMatrix);
        elseif diagonal_updown_win(gridMatrix,r,c) == 1
            win = 1;
            xlabel('Congratulations Player 2! You win!!!')
            drawScene(my_scn,gridMatrix);
        end

        
        
        
    end
end

pause(4)
clc
xlabel('Thank you so much for playing our game, coded by Nick Webber, with')
drawScene(my_scn,gridMatrix);
pause(3)
xlabel('help and assistance from Group Q members, Reiley Kreiser,')
drawScene(my_scn,gridMatrix);
pause(3)
xlabel('Ethan Chilton, and Andrew Gordon');
drawScene(my_scn,gridMatrix);
pause(2)

xlabel('Please press any button to close out of this window :)')
[~,~,closeWindow] = getMouseInput(my_scn);
close all







