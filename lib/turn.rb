class Turn
  attr_reader :player_cells_fired_upon, :computer_target_coordinates, :user_board, :computer_board

  def initialize
    @player_cells_fired_upon = []
    @computer_target_coordinates ||= create_computer_targets
    @user_board ||= Board.new
    @computer_board ||= Board.new
  end

  def create_computer_targets
    x_axis = ("A".."D").to_a
    y_axis = ("1".."4").to_a
    coordinates = []
    x_axis.each do |x|
      y_axis.each do |y|
        coordinates << (x + y)
      end
    end
    coordinates.shuffle
  end

  def commence_player_turn
    puts "============Computer Board============"
    puts @computer_board.render
    puts "============Player Board============"
    puts @user_board.render(true)
    puts "~*~*~*~*~*~*~Take A Turn~*~*~*~*~*~*~"
    get_coordinate
  end

  def get_coordinate
    puts "Enter the coordinate for your shot: "
    coordinate = gets.chomp
    validate_coordinate(coordinate)
  end

  def validate_coordinate(coordinate)
    if @player_cells_fired_upon.include?(coordinate)
      warn_player_repeat_target
    elsif @user_board.valid_coordinate?(coordinate) == false
      puts "Please enter a valid coordinate: "
      coordinate = gets.chomp
      validate_coordinate(coordinate)
    elsif @user_board.valid_coordinate?(coordinate) == true
      player_turn(coordinate)
    end
  end

  def warn_player_repeat_target
    puts "You have already fired on that cell. Try again."
    get_coordinate
  end

  def player_turn(coordinate)
    @computer_board.cells[coordinate].fire_upon
    @player_cells_fired_upon << coordinate
    report_player_turn_results(coordinate)
    computer_turn
  end

  def computer_turn
    coordinate = @computer_target_coordinates.first
    @user_board.cells[coordinate].fire_upon
    @computer_target_coordinates.shift
    report_computer_turn_results(coordinate)
    #check for winner
    commence_player_turn
  end

  def report_player_turn_results(coordinate)
    puts "Your shot on #{coordinate} #{player_turn_result(coordinate)}."
  end

  def report_computer_turn_results(coordinate)
    puts "My shot on #{coordinate} #{computer_turn_result(coordinate)}."
  end

  def computer_turn_result(coordinate)
    if @user_board.cells[coordinate].empty == true
      "was a miss"
    elsif @user_board.cells[coordinate].render == "H"
      "hit a ship"
    elsif @user_board.cells[coordinate].render == "X"
      "sunk a ship"
    end
  end

  def player_turn_result(coordinate)
    if @computer_board.cells[coordinate].empty == true
      "was a miss"
    elsif @computer_board.cells[coordinate].render == "H"
      "hit a ship"
    elsif @computer_board.cells[coordinate].render == "X"
      "sunk a ship"
    end
  end
end
