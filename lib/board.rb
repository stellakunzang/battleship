class Board
  attr_reader :cells

  def initialize
    @cells = cells
  end

  def cells
    cells = {}
    x_axis = ("A".."D").to_a
    y_axis = ("1".."4").to_a

    keys = []
    x_axis.each do |x|
      y_axis.each do |y|
        keys << (x + y)
      end
    end

    values = []
    keys.each do |key|
      values << Cell.new(key)
    end

    keys.each do |key|
      values.each do |value|
        cells[key] = value
      end
    end
    cells
  end

  def valid_coordinate?(coordinate)
    if cells[coordinate] == nil
      false
    else
      true
    end
  end

  def valid_placement?(ship, coordinates)
    ship.length == coordinates.length && valid_coordinate_array?(coordinates) == true
  end

  def valid_coordinate_array?(coordinates)
    if collect_letters(coordinates).uniq.length == 1 && consecutive_numbers?(coordinates) == true
      true
    elsif collect_numbers(coordinates).uniq.length == 1 && consecutive_letters?(coordinates) == true
      true
    else
      false
    end
  end

  def collect_letters(coordinates)
    letters = []
    coordinates.each do |coordinate|
      letters << coordinate[0]
    end
    letters
  end

  def collect_numbers(coordinates)
    numbers = []
    coordinates.each do |coordinate|
      numbers << coordinate[1]
    end
    numbers
  end

  def consecutive_letters?(coordinates)
    (collect_letters(coordinates)[0].ord..collect_letters(coordinates)[-1].ord).to_a == collect_letters(coordinates).map { |letter| letter.ord }
    # do I need to sort for the first part?
    # (letters[0].ord..letters[-1].ord).to_a == letters.map { |letter| letter.ord }
  end

  def consecutive_numbers?(coordinates)
    (collect_numbers(coordinates)[0]..collect_numbers(coordinates)[-1]).to_a == collect_numbers(coordinates)
    # do I need to sort for the first part?
    # (numbers[0]..numbers[-1]).to_a == numbers
  end

  def render(show = false)
    if show == false
      puts "  1 2 3 4 \n" +
          "A #{cells["A1"].render} #{cells["A2"].render} #{cells["A3"].render} #{cells["A4"].render} \n" +
          "B #{cells["B1"].render} #{cells["B2"].render} #{cells["B3"].render} #{cells["B4"].render} \n" +
          "C #{cells["C1"].render} #{cells["C2"].render} #{cells["C3"].render} #{cells["C4"].render} \n" +
          "D #{cells["D1"].render} #{cells["D2"].render} #{cells["D3"].render} #{cells["D4"].render} \n"
    else
      puts "  1 2 3 4 \n" +
          "A #{cells["A1"].render(true)} #{cells["A2"].render(true)} #{cells["A3"].render(true)} #{cells["A4"].render(true)} \n" +
          "B #{cells["B1"].render(true)} #{cells["B2"].render(true)} #{cells["B3"].render(true)} #{cells["B4"].render(true)} \n" +
          "C #{cells["C1"].render(true)} #{cells["C2"].render(true)} #{cells["C3"].render(true)} #{cells["C4"].render(true)} \n" +
          "D #{cells["D1"].render(true)} #{cells["D2"].render(true)} #{cells["D3"].render(true)} #{cells["D4"].render(true)} \n"
    end
  end
end
