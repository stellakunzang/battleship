#game class file
require './lib/cell'
require './lib/board'
require './lib/ship'

 class Game

  attr_reader :player

  def initialize(player)
    @player = player
  end

  def main_menu
    # User is shown the main menu where they can play or quit
    p "Welcome to BATTLESHIP"
    p "Enter p to play. Enter q to quit."
    reply = gets.chomp.downcase
  end


  def set_up(user_response)
    if user_response == "p"
      # computer places ships at radom


    end
  end

  def random_coordinates
    random_number = rand(1..50)

    if random_number.even?
      coordinates_array = []
      random_number = rand(1..50)
      x_axis = ("A".."D").to_a
      x_axis = x_axis[rand(0..3)]
      coord = x_axis

      y_axis = ("1".."4").to_a
      y_axis.each do |y|
          coordinates_array << coord + y
        end

          if random_number.even?
            coordinates_array.pop
          else
            coordinates_array.shift
          end
    else
      coordinates_array = []
      random_number = rand(1..50)
      y_axis = ("1".."4").to_a
      y_axis = y_axis[rand(0..3)]
      coord = y_axis

      x_axis = ("A".."D").to_a
      x_axis.each do |x|
          coordinates_array << x + coord
        end

          if random_number.even?
            coordinates_array.pop
          else
            coordinates_array.shift
          end
    end
      coordinates_array
  end

  def compter_places_ships(ship, coordinates)
    board = Board.new
    game = Game.new('player1')
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    loop do
      if board.valid_placement?(cruiser, random_coordinates)
        board.place(cruiser, random_coordinates)
        break 
      end
    end

    binding.pry



  end

  def game_end


  end

end
