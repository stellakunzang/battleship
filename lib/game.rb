class Game
  attr_reader :cruiser, :submarine, :computer, :player_cells_fired_upon
  attr_accessor :player_board

  def initialize
    @player_board ||= Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @computer = Computer.new
    @player_cells_fired_upon = []
  end

  def main_menu
    puts "Welcome to BATTLESHIP \n" +
    "Enter p to play. Enter q to quit. \n"
    reply = gets.chomp
    if reply == "p"
      setup
    elsif
      reply == "q"
      puts "Goodbye"
    else
      main_menu
    end
  end

  def setup
    computer.place_cruiser
    computer.place_submarine
    puts "I have laid out my ships on the grip. \n"+
    "You now need to lay out your two ships. \n"+
    "The Cruiser is three units long and the Submarine is two units long. \n"
    @player_board.render
    "Enter the squares for the Cruiser (3 spaces): "
    user_input = gets.chomp
    coordinates =(user_input.upcase.gsub(/[^\w]/,"")).scan(/../)
    validate_user_placement_cruiser(cruiser, coordinates)
  end

  def validate_user_placement_cruiser(cruiser, coordinates)
    if @player_board.valid_placement?(cruiser, coordinates)
      @player_board.place(cruiser, coordinates)
      @player_board.render(true)
      puts "Enter the squares for the Submarine (2 spaces): "
      user_input = gets.chomp
      coordinates = (user_input.upcase.gsub(/[^\w]/,"")).scan(/../)
      validate_user_placement_submarine(submarine, coordinates)
    else
      puts "Those are invalid coordiantes. Please try again: "
      user_input = gets.chomp
      coordinates = (user_input.upcase.gsub(/[^\w]/,"")).scan(/../)
      validate_user_placement_cruiser(cruiser, coordinates)
    end
  end

  def validate_user_placement_submarine(submarine, coordinates)
    if @player_board.valid_placement?(submarine, coordinates)
      @player_board.place(submarine, coordinates)
      @player_board.render(true)
      initiate_game
    else
      puts "Those are invalid coordiantes. Please try again: "
      user_input = gets.chomp
      coordinates = (user_input.upcase.gsub(/[^\w]/,"")).scan(/../)
      validate_user_placement_submarine(submarine, coordinates)
    end
  end

  def initiate_game
    commence_player_turn
  end

  def commence_player_turn
    puts "============Computer Board============"
    puts computer.board.render
    puts "============Player Board============"
    puts player_board.render(true)
    puts "~*~*~*~*~*~*~Take A Turn~*~*~*~*~*~*~"
    get_coordinate
  end

  def get_coordinate
    puts "Enter the coordinate for your shot: "
    coordinate = gets.chomp.upcase
    validate_coordinate(coordinate)
  end

  def validate_coordinate(coordinate)
    if @player_cells_fired_upon.include?(coordinate)
      warn_player_repeat_target
    elsif player_board.valid_coordinate?(coordinate) == false
      puts "Please enter a valid coordinate: "
      coordinate = gets.chomp.upcase
      validate_coordinate(coordinate)
    elsif player_board.valid_coordinate?(coordinate) == true
      player_turn(coordinate)
    end
  end

  def warn_player_repeat_target
    puts "You have already fired on that cell. Try again."
    get_coordinate
  end

  def player_turn(coordinate)
    computer.board.cells[coordinate].fire_upon
    @player_cells_fired_upon << coordinate
    report_player_turn_results(coordinate)
    computer_turn
  end

  def computer_turn
    coordinate = computer.computer_target_coordinates.first
    player_board.cells[coordinate].fire_upon
    computer.computer_target_coordinates.shift
    report_computer_turn_results(coordinate)
    end_game?
  end

  def end_game?
    if @cruiser.sunk? == true && @submarine.sunk? == true
      puts "I won!"
      main_menu
    elsif computer.cruiser.sunk? == true && computer.submarine.sunk? == true
      puts "You won!"
      main_menu
    else
      commence_player_turn
    end
  end

  def report_player_turn_results(coordinate)
    puts "Your shot on #{coordinate} #{player_turn_result(coordinate)}."
  end

  def report_computer_turn_results(coordinate)
    puts "My shot on #{coordinate} #{computer_turn_result(coordinate)}."
  end

  def computer_turn_result(coordinate)
    if player_board.cells[coordinate].empty == true
      "was a miss"
    elsif player_board.cells[coordinate].render == "H"
      "hit a ship"
    elsif player_board.cells[coordinate].render == "X"
      "sunk a ship"
    end
  end

  def player_turn_result(coordinate)
    if computer.board.cells[coordinate].empty == true
      "was a miss"
    elsif computer.board.cells[coordinate].render == "H"
      "hit a ship"
    elsif computer.board.cells[coordinate].render == "X"
      "sunk a ship"
    end
  end
end
