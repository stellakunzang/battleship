require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require 'pry'

class BoardTest < Minitest::Test

  def test_it_exists
    board = Board.new

    assert_instance_of Board, board
  end

  def test_it_has_attributes
    board = Board.new

    # asserting length is problematic because it can fluctuate; need to test hash itself
  end

  def test_it_can_render_default
    board = Board.new
    board.render
    # use string methods to test that the basic board at start of game is...

  end

  def test_it_can_render_show_true
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    board.render(true)

  end

  def test_it_can_render_with_hits
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    cruiser.hit
    board.render

  end

  def test_it_can_render_sunken_ships
    board = Board.new
    cruiser = Ship.new("Cruiser", 1)
    cruiser.hit
    board.render

  end
end
