class Cell

  attr_reader :coordinate, :empty, :ship, :fired_upon

  def initialize(coordinate)
    @coordinate = coordinate
    @empty = true
    @ship = ship
    @fired_upon = false
  end

  def ship
    if @empty == true
      nil
    else
      @ship
    end
  end

  def empty?
    @empty
  end

  def place_ship(ship)
    @empty = false
    @ship = ship
  end

  def fired_upon?
    @fired_upon
  end
    # not yet sure that the fire_upon method can change the value or if that requires creating an instance variable

  def fire_upon
    @fired_upon = true
    ship.health -= 1
  end

  def render(show = false)
    if @fired_upon == false
      if show == true && empty? == false
        "S"
      else
        "."
      end
    elsif @fired_upon == true && ship.health == ship.length
      "M"
    elsif @fired_upon == true && ship.length > ship.health < 0
      # not sure if this combination of conditionals will work
      "H"
    elsif @fired_upon == true && ship.sunk? == true
      "X"
    end
  end
end
    # it takes an optional boolean argument but I don't understand why
    # this method displays whether the cell has been fired upon, whether it contains a ship, etc.
    #
