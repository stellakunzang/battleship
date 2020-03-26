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

    assert_equal 16, board.cells.length
  end

  def test_it_has_valid_coordinates

    board = Board.new

    assert_equal true, board.valid_coordinate?("A1")
    assert_equal false, board.valid_coordinate?("E5")
  end


  def test_it_is_a_valid_placement

    board = Board.new
    cruiser = Ship.new("Cruiser", 1)
    submarine = Ship.new("Submarine", 2)

    assert_equal true, board.valid_placement?(cruiser, ["A1"])
    assert_equal false, board.valid_placement?(submarine, ["A2", "A3", "A4"])
    assert_equal true, board.valid_placement?(submarine, ["B2", "B3"])
    assert_equal true, board.valid_placement?(cruiser, ["A1", "A2", "A3"])
  end



end
