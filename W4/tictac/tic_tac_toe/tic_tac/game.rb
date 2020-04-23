require_relative "human_player"
require_relative "computer_player"
require_relative "board"
require "byebug"
class Game

    def initialize()
        @human_player = HumanPlayer.new("Human")
        @computer_player = ComputerPlayer.new("Computer")
        @board = Board.new
        @current_player = @human_player
    end       

    def current_player
        @current_player
    end

    def switch_players!
        if @current_player == @human_player
            @current_player = @computer_player
        else
            @current_player = @human_player
        end
    end

    def play_turn
        puts ""
        puts "It's #{@current_player.name}'s turn"
        pos = @current_player.get_move
        if !@board.place_mark(pos, @current_player.mark)
            puts "Try Again"
            self.play_turn 
        else
            @current_player.display(@board.grid)
            self.switch_players!
        end
    end

    def play
        self.play_turn
    end

    def over?
        if winner = @board.winner
            if winner == @human_player.mark
                puts "Congrats you Won!"
            elsif winner == @computer_player.mark
                puts "Sorry! You lost"
            end
            return true
        elsif @board.draw
            puts "it's a draw!"
            return true
        end
        false

    end
end