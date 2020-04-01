require './lib/board'
require './lib/ship'
class Cell

  attr_reader :coordinate, :ship, :empty

  def initialize(coordinate)
    @coordinate = coordinate
    @empty = true
    @ship = nil
    @fired_upon = false
  end

  def empty?
    @empty
  end

  def place_ship(ship)
    @empty = false
    @ship = ship
  end

  def fire_upon
    if @ship == nil
      @fired_upon = true
    elsif @ship == ship
      ship.hit
      @fired_upon = true
    end
  end

  def fired_upon?
    @fired_upon
  end

  def render(show = false)
    if @fired_upon == false
      if show == true && empty? == false
        "S"
      else
        "."
      end
    elsif @fired_upon == true
      if @ship = ship
        if ship.length > ship.health && ship.sunk? == false
          "H"
        elsif ship.sunk? == true
          "X"
        end
      else
        "M"
      end
    end
  end
end
