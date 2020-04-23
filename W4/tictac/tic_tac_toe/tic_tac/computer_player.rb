require_relative "board"
class ComputerPlayer
    
    attr_reader :mark, :name, :board

    def initialize(name)
        @mark = :O
        @name = name
    end

    def get_move
        #find winning move for robot
        #if win = winning_move
        #   if there's a winning move return the winning pos
       # if move = winning_move?
        #    return move
        #else
            rand_row = rand(0..2)
            rand_col = rand(0..2)
            return [rand_row, rand_col]
        #end
    end
=begin
    def winning_move?
        board.grid.each_with_index do |row, idx1|
            if counting(row, mark)
                row.each_with_index do |ele, idx2|
                    if ele == '_'
                        return [idx1, idx2]
                    end
                end
            end
        end

        board.grid.transpose.each_with_index do |row, idx1|
            if counting(row, mark)
                row.each_with_index do |ele, idx2|
                    if ele == '_'
                        return [idx2, idx1]
                    end
                end
            end
        end
        nil
    end

    def counting(arr, mark)
        n = arr.count {|ele| ele == mark}
        if n == 2 && arr.one? {|ele| ele == '_'}
            return true
        end
        false
    end
=end
    def display(board)
        @board = board
        puts "board state"
        puts "------------"
        board.each do |row|
            puts row.join(" ")
        end
        puts ""
        puts "------------"
    end

end