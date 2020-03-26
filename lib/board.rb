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

  def render(show = false)
    if show = false
      puts "  1 2 3 4 \n" +
          "A #{cells["A1"].render} #{cells["A2"].render} #{cells["A3"].render} #{cells["A4"].render} \n" +
          "B #{cells["B1"].render} #{cells["B2"].render} #{cells["B3"].render} #{cells["B4"].render} \n" +
          "C #{cells["C1"].render} #{cells["C2"].render} #{cells["C3"].render} #{cells["C4"].render} \n" +
          "D #{cells["D1"].render} #{cells["D2"].render} #{cells["D3"].render} #{cells["D4"].render} \n"
    else
      puts "  1 2 3 4 \n" +
          "A #{cells["A1"].render(true} #{cells["A2"].render(true} #{cells["A3"].render(true} #{cells["A4"].render(true} \n" +
          "B #{cells["B1"].render(true} #{cells["B2"].render(true} #{cells["B3"].render(true} #{cells["B4"].render(true} \n" +
          "C #{cells["C1"].render(true} #{cells["C2"].render(true} #{cells["C3"].render(true} #{cells["C4"].render(true} \n" +
          "D #{cells["D1"].render(true} #{cells["D2"].render(true} #{cells["D3"].render(true} #{cells["D4"].render(true} \n"
    end
  end
end
