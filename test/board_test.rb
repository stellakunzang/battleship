require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require 'pry'

class BoardTest < Minitest::Test

  def test_it_exists
    skip
    board = Board.new

    assert_instance_of Board, board
  end

  def test_it_has_attributes
    skip
    board = Board.new

    assert_equal 16, board.cells.length
  end

  def test_it_has_valid_coordinates
    skip
    board = Board.new

    assert_equal true, board.valid_coordinate?("A1")
    assert_equal false, board.valid_coordinate?("E5")
  end

  def test_it_can_show_if_cell_is_empty
    skip
    board = Board.new

    assert_equal true, board.is_cell_empty?(["A1", "A2", "A3"])
  end

  def test_it_can_show_if_cells_are_in_order

    board = Board.new

    assert_equal true, board.cells_are_in_order(["A1", "A2", "A3"])
    assert_equal false, board.cells_are_in_order(["A1", "A2", "A4"])
  end


  def test_it_is_a_valid_placement
    skip
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert_equal false, board.valid_placement?(cruiser, ["A1", "A2"])
    assert_equal false, board.valid_placement?(submarine, ["A2", "A3", "A4"])
    assert_equal true, board.valid_placement?(submarine, ["B2", "B3"])
    assert_equal true, board.valid_placement?(cruiser, ["A1", "A2", "A3"])
  end


end
