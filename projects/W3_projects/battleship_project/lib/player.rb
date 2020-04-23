class Player

    def get_move
        puts "enter a position with coordinates seperated with a space like '4 7'"
        arr = gets.chomp.split(" ")
        new = []
        arr.each {|ele| new << ele.to_i}
        new
    end

    
end
