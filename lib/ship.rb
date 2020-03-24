require 'pry';


class Ship

  attr_reader :ship_name, :length
  attr_accessor :health

  def initialize(ship_name, length)
    @ship_name = ship_name
    @length = length
    @health = @length
  end

  def health
    @health
 end

  def hit
    @health -= 1
  end

  def sunk?
    if @health == 0
      true
    else
      false
    end
  end

  binding.pry
end
