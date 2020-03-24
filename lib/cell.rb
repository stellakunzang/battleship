class Cell

  attr_reader :coordinate, :empty, :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @empty = true
  end

  def ship
    if @empty == true
      nil
    else
      ship
    end
  end

  def empty?
    @empty
  end

  def place_ship(ship)
    @empty = false
    ship = ship
  end

  def fired_upon?
    false
  end
    # not yet sure that the fire_upon method can change the value or if that requires creating an instance variable

  def fire_upon
    fired_upon? == true
    if ship
      ship.health -= 1
      # will we need to add to this method for sunken ship?
      # can use ship.hit here?
    end
  end

  def render(show = false)
    #add optional argument which reveals hidden ships
    if fired_upon == false
      if show == true && empty? == false
        "S"
      else
        "."
      end
    elsif fired_upon == true && ship.health == ship.length
      "M"
    elsif fired_upon == true && ship.length > ship.health < 0
      # not sure if this combination of conditionals will work 
      "H"
    elsif fired_upon == true && ship.sunk? == true
      "X"
    end
    # it takes an optional boolean argument but I don't understand why
    # this method displays whether the cell has been fired upon, whether it contains a ship, etc.
    #
  end
end
