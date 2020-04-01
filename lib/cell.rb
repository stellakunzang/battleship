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

  def render_empty(show)
    if show == true && empty? == false
      "S"
    else
      "."
    end
  end

  def render_hit_sunk
    if ship.length > ship.health && ship.sunk? == false
      "H"
    elsif ship.sunk? == true
      "X"
    end
  end

  def render(show = false)
    if @fired_upon == false
      render_empty(show)
    elsif @fired_upon == true && @ship = ship
      render_hit_sunk
    else
      "M"
    end
  end

end
