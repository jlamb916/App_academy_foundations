
# Board

# In your Board class, you should have a grid instance variable to keep track of the board tiles. You should also have the following methods:
#place_mark, which takes a position such as [0, 0] and a mark such as :X or :O as arguments. It should raise an error if the position isn't empty.
#empty?, which takes a position as an argument
#winner, which should return a mark
#over?, which should return true or false

class Board

    attr_reader :grid, :result
    attr_writer :result

    def initialize
        @grid = Array.new(3) {Array.new(3, "_")}
        @result = ""
    end
    
    def [](pos)
        x, y = pos
        @grid[x][y]
    end
    
    def []=(pos, mark)
        x, y = pos
        @grid[x][y] = mark
    end

    def place_mark(pos, mark)
        if self.empty?(pos)
            self[pos] = mark
            return true
        else
            puts "Space isn't empty, Try again"
            return false
        end
    end

    def empty?(pos)
        self[pos] == "_"
    end

    #returns the winning symbol
    def winner
        @grid.each do |row|
            if row.all? {|ele| ele == :X } || (row.all? {|ele| ele == :O})
                
                return row[0]
            end
        end

        if (@grid[0][0] == :X && @grid[1][1] == :X && @grid[2][2] == :X) ||
            (@grid[0][2] == :X && @grid[1][1] == :X && @grid[2][0] == :X) ||
            (@grid[0][0] == :O && @grid[1][1] == :O && @grid[2][2] == :O) ||
            (@grid[0][2] == :O && @grid[1][1] == :O && @grid[2][0] == :O)
            return @grid[1][1]
        end
        
        transpose = @grid.transpose
        
        transpose.each do |row|
            if (row.all? {|ele| ele == :X}) || (row.all? {|ele| ele == :O})
                return row[0]
            end
        end

        nil
    end

    def draw
        flat = @grid.flatten
        if flat.all? {|ele| (ele == :O || ele == :X) }
            return true
        end
        return false
    end
end