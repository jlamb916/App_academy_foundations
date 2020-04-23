require_relative "game"

puts "IT'S TIME TO TI TITI TTIT ITIC TAC TOOOO"
game = Game.new

until game.over? do
    puts "------------------"
    game.play
end