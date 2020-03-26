require 'pry';

class Board :cells

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

  def valid_coordinate?(cell)
    if @cells.include?(cell)
      true
    else
      false
    end
  end


  def is_cell_empty?(cells)
    values = []
    cells.each do |cell|
      values << @cells[cell].empty
    end
    if values.include?(false)
      false
    else
      true
    end
  end

  def cells_are_in_order(cells)
    # binding.pry
    value = []
    cells.each do |cell|
      value << cell.delete("A")
    end
    value.include? == value.each_cons(4)
  end


  def valid_placement?(ship, cells)
    if ship.length == cells.length && is_cell_empty?(cells) == true
      true
    else
      false
    end
  end




end
