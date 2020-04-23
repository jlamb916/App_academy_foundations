
class HumanPlayer
    
    attr_reader :mark, :name

    def initialize(name)
        @mark = :X
        @name = name
    end

    def get_move
        nums = ["0", "1", "2"]
        puts "Enter a move in the form of '0, 0'"
        pos = gets.chomp.split(", ")
        if (!(nums.include?(pos[0])) || !(nums.include?(pos[1])))
            puts "invalid input! Please enter a valid Input"
            self.get_move
        else
            pos.map! {|ele| ele.to_i}
        end
    end

    def display(board)
        puts ""
        puts "------------"
        board.each do |row|
            puts row.join(" ")
        end
        puts ""
        puts "------------"
    end
end