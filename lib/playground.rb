require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'
require 'pry';

board = Board.new
player_board = Board.new
cruiser = Ship.new("Cruiser", 3)
submarine = Ship.new("Submarine", 2)

loop do
p "which ship would you like to place? Choose either cruiser or submarine. q to quit"
ship = gets.chomp.downcase
  if ship == "q"
    break
  elsif ship == cruiser.name.downcase
    ship_var = cruiser
  elsif ship == submarine.name.downcase
    ship_var = submarine
  elsif ship != cruiser.name.downcase || ship != submarine.name.downcase
    puts "please enter a valid ship"
  end

p "enter coordinates. (example: A1 A2 A3) q to quit=>  "
coordinates = gets.chomp.split

  if coordinates == "q"
      break
  elsif @player_board.valid_placement?(ship_var, coordinates) == true
      @player_board.place(ship, coordinates)
      break
  else
    p "Those are invalid cooridnates. Please try again!"
  end
end
