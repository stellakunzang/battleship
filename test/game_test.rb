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
    game = Game.new('player1')

    assert_instance_of Game, game
  end

  def test_it_has_readable_attributes

    game = Game.new('player1')

    assert_equal 'player1', game.player

  end

  def test_it_can_place_cruiser_randomly

    game = Game.new('player1')
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    random_coordiantes = game.random_coordinates_cruiser

    assert_equal true, board.valid_placement?(cruiser, random_coordiantes)
  end

  def test_it_can_place_the_cruiser

    game = Game.new('player1')
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    random_coordiantes = game.random_coordinates_cruiser

    assert_equal true, game.place_cruiser
  end

  def test_it_can_verify_sub_coordinates

    game = Game.new('player1')
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    random_coordiantes = game.random_coordinates_cruiser
    game.place_cruiser
    sub_random_coordinates = game.random_coordinates_submarine


    assert_equal true, game.sub_coordinates_are_valid
  end

  def test_it_can_place_sub
    
    game = Game.new('player1')
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    random_coordiantes = game.random_coordinates_cruiser
    game.place_cruiser
    sub_random_coordinates = game.random_coordinates_submarine
    game.sub_coordinates_are_valid

    assert_equal true, game.place_submarine
  end

end
