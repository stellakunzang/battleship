require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'
require 'pry'


class GameTest < Minitest::Test

  def test_it_exists
    game = Game.new

    assert_instance_of Game, game
  end

  def test_player_can_place_ship
    game = Game.new
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert_equal ["A1", "A2", "A3"], game.user_places_ships(cruiser, ["A1", "A2", "A3"])
    assert_equal "Those are invalid coordinates. Please try again!", game.user_places_ships(cruiser, ["A1", "A2", "A4"])
  end

  def test_player_can_place_ship

    game = Game.new('player1')
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    # assert_equal ["A1", "A2", "A3"], game.user_places_ships(cruiser, ["A1", "A2", "A3"])
    assert_equal "Those are invalid cooridnates. Please try again!", game.user_places_ships(cruiser, ["A1", "A2", "A4"])
  end

end
