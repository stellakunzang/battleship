#game class file
class Game

  def initialize(player)
    @player = player

  end

  def main_menu
    # User is shown the main menu where they can play or quit
    p "Welcome to BATTLESHIP"
    p "Enter p to play. Enter q to quit."
    reply = gets.chomp.downcase
  end

  def create_coordinates_array
    x_axis = ("A".."D").to_a
      y_axis = ("1".."4").to_a
      @coordinates = []
      x_axis.each do |x|
        y_axis.each do |y|
          @coordinates << (x + y)
        end
      end
  end


  def set_up(user_response)
    if user_response == "p"
      # computer places ships at radom


    end
  end

  def compter_places_ships
    binding.pry
    board = Board.new
    coordinates =
    cruiser = Ship.new('Cruiser', 3)
    submarine = Ship.new("Submarine", 2)


  end

  def game_end

  end

end
