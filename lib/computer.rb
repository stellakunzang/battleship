class Computer
  attr_reader :cruiser, :submarine
  attr_accessor :board, :computer_target_coordinates


  def initialize
    @board ||= Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @computer_target_coordinates ||= create_computer_targets
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
    @board.place(cruiser, random_coordinates_cruiser)
  end

  def sub_coordinates_are_valid
    #put counter to make sure that loop was running.
    counter = 0
    loop do
      if @board.valid_placement?(submarine, random_coordinates_submarine) == true
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
        @board.place(submarine, random_coordinates_submarine)
    end
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
end
