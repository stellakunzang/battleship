require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship.rb'
require 'pry';


class ShipTest < Minitest::Test

  def test_ship_exsist

    cruiser = Ship.new('cruiser', 3)

    assert_instance_of Ship, cruiser
  end

  def test_it_has_readable_attributes

    cruiser = Ship.new('cruiser', 3)

    assert_equal 'cruiser', cruiser.ship_name
    assert_equal 3, cruiser.length
  end

  def test_ship_health

    cruiser = Ship.new('cruiser', 3)

    assert_equal 3, cruiser.health
  end

  def test_if_ship_was_hit

    cruiser = Ship.new('cruiser', 3)

    assert_equal 2, cruiser.hit
  end

  def test_if_ship_sunk

    cruiser = Ship.new('cruiser', 3)
    cruiser.hit
    cruiser.hit
    cruiser.hit

    assert_equal true, cruiser.sunk?
  end

end
