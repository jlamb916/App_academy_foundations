Tic Tac Toe
Profile
Let's write a Tic-Tac-Toe game! Read the entire instructions before getting started. You be creating this entire project from scratch, no skeleton. Below are the methods we think are necessary to implement the game. However you are welcome to create any other helper methods that you think will be useful. You've already built a few games, so think about the patterns you've used previously. You'll have to reason out what the methods should do! We'll leave the decision making to you.

Don't freak out if you find this difficult! This is expected. Making design decisions is hard, so you'll find yourself going back and forth changing methods frequently. Be grateful we didn't ask you to do Battleship without specs :P.

Read all instructions first before starting so you understand the general direction.

Background
We'll be building 4 classes to construct our game. Begin by creating a tic_tac_toe directory with the following structure:

tic_tac_toe/
├── board.rb
├── computer_player.rb
├── human_player.rb
└── game.rb

Board
In your Board class, you should have a grid instance variable to keep track of the board tiles. You should also have the following methods:
#place_mark, which takes a position such as [0, 0] and a mark such as :X or :O as arguments. It should raise an error if the position isn't empty.
#empty?, which takes a position as an argument
#winner, which should return a mark
#over?, which should return true or false
HumanPlayer and ComputerPlayer
In both player classes, have an instance variable mark that the game will set on initialize.

In your HumanPlayer class,

#display should print the board out to the console, you should format the output nicely.
#get_move should allow the player to enter a move of the form '0, 0', and return it as a position of the form [0, 0]

In your ComputerPlayer class,

#display should store the board it's passed as an instance variable, so that get_move has access to it
#get_move should return a position representing a winning move if one is available, and otherwise return a random position
Game
In your Game class, set the marks of the players you are passed. Include the following methods:

#current_player
#switch_players!
#play_turn, which handles the logic for a single turn
#play, which calls #play_turn each time through a loop until Game#over?
Pro tips
Both HumanPlayer and ComputerPlayer should have the same interface; they should have the same set of methods. This means they should be interchangeable.
Your Game class should be passed two player objects on instantiation; because both player classes have the same interface, the game should not know nor care what kind of players it is given.