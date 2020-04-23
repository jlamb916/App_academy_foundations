#Board should create 2d array
#populate the array with a standby
#fill in the array with ships
#detect when a ship is hit, or not

class Board

    attr_reader :size

    def self.print_grid(grid)
        grid.each do |row|
            puts row.join(" ")
        end
    end

    def initialize(n)
        @grid = Array.new(n) {Array.new(n, :N)}
        @size = n * n
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, val)
        row, col = pos
        @grid[row][col] = val
    end

    def num_ships
        @grid.flatten.count {|ele| ele == :S}
    end

    def attack(pos)
        if self[pos] == :S
            self[pos] = :H 
            puts "You sunk my battleship!"
            return true
        else
            self[pos] = :X
            return false
        end
    end

    def place_random_ships
        ship_count = @size * 0.25
        n = @grid.length
        while self.num_ships < ship_count
            rand_row = rand(0...n)
            rand_col = rand(0...n)
            pos = rand_row, rand_col
            self[pos] = :S
        end
    end

    def hidden_ships_grid
        @grid.map do |row|
            row.map do |ele|
                if ele == :S
                    :N
                else
                    ele
                end
            end
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(hidden_ships_grid)
    end
end