require_relative "./lib/game"

number = rand(1000..9999)

game = Game.new(number)
game.play