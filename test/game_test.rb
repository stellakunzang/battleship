#game test file
require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'
require 'pry'


class GameTest < Minitest::Test

  def test_it_exists
    skip
    game = Game.new('player1')

    assert_instance_of Game, game
  end

  def test_it_has_readable_attributes
    skip
    game = Game.new('player1')

    assert_equal 'player1', game.player

  end

  def test_it_can_place_cruiser_randomly
    skip
    game = Game.new('player1')
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    random_coordiantes = game.random_coordinates_cruiser

    assert_equal true, board.valid_placement?(cruiser, random_coordiantes)
  end

  def test_it_can_place_the_cruiser
    skip
    game = Game.new('player1')
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    random_coordiantes = game.random_coordinates_cruiser
    # put assert_equal true since im not sure how to test randomness
    assert_equal true, game.place_cruiser
  end

  def test_it_can_verify_sub_coordinates
    skip
    game = Game.new('player1')
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    random_coordiantes = game.random_coordinates_cruiser
    game.place_cruiser
    sub_random_coordinates = game.random_coordinates_submarine


    assert_equal true, game.sub_coordinates_are_valid
  end

  def test_it_can_place_sub
    skip
    game = Game.new('player1')
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    random_coordiantes = game.random_coordinates_cruiser
    game.place_cruiser
    sub_random_coordinates = game.random_coordinates_submarine
    game.sub_coordinates_are_valid
    # put assert_equal true since im not sure how to test randomness

    assert_equal true, game.place_submarine
  end

  def test_player_can_place_ship
    skip
    game = Game.new('player1')
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert_equal ["A1", "A2", "A3"], game.user_places_ships(cruiser, ["A1", "A2", "A3"])
    assert_equal "Those are invalid cooridnates. Please try again!", game.user_places_ships(cruiser, ["A1", "A2", "A4"])
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
