#game class file
require './lib/cell'
require './lib/board'
require './lib/ship'

 class Game

  attr_reader :player, :cruiser, :submarine
  attr_accessor :computer_board

  def initialize(player)
    @player = player
    @computer_board = Board.new
    @player_board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)

  end

  def user_places_ships(ship, coordinates)
    loop do
      p "which ship would you like to place? => "
        ship = gets.chomp
      p "enter coordinates => "
        coordinates = gets.chomp
      if @player_board.valid_placement?(ship, coordinates)
          @player_board.place(ship, coordinates)
          break
      else
        p "Those are invalid cooridnates. Please try again!"
      end
    end
  end

  def random_coordinates_cruiser
    random_number = rand(1..10)

    if random_number.even?
      coordinates_array = []
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

  def random_coordinates_submarine
    random_number = rand(1..30)
    range1 = 1..10
    range2 = 11..20

    if random_number.even?
      coordinates_array = []
      x_axis = ("A".."D").to_a
      x_axis = x_axis[rand(0..3)]
      coord = x_axis

      y_axis = ("1".."4").to_a
      y_axis.each do |y|
          coordinates_array << coord + y
        end

          if range1.include?(random_number)
            coordinates_array.pop(2)
          elsif range2.include?(random_number)
            coordinates_array.shift
            coordinates_array.shift
          else
            coordinates_array.shift
            coordinates_array.pop
          end
        coordinates_array
    else
      coordinates_array = []
      y_axis = ("1".."4").to_a
      y_axis = y_axis[rand(0..3)]
      coord = y_axis

      x_axis = ("A".."D").to_a
      x_axis.each do |x|
          coordinates_array << x + coord
        end
        if range1.include?(random_number)
          coordinates_array.pop(2)
        elsif range2.include?(random_number)
          coordinates_array.shift
          coordinates_array.shift
        else
          coordinates_array.shift
          coordinates_array.pop
        end
        coordinates_array
    end

  end

  def place_cruiser
    @computer_board.place(cruiser, random_coordinates_cruiser)
  end

  def sub_coordinates_are_valid
    #put counter to make sure that loop was running.
    counter = 0
    loop do
      if @computer_board.valid_placement?(submarine, random_coordinates_submarine) == true
        break
      else
        counter += 1
      end

    end
    #if im correct this gets returned when the method lands on valid coordiantes
    true
  end

  def place_submarine
      #how can we test this?
    if sub_coordinates_are_valid == true
        @computer_board.place(submarine, random_coordinates_submarine)
    end

  end


end
