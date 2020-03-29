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
    assert_equal [], game.coordinates
  end


  def test_it_can_create_coordinates
    skip
    board = Board.new
    board.create_coordinates_array

    assert_equal ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"], board.create_coordinates_array
  end



end
