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

    board.cells.each do |coordinate, cell|
      assert_instance_of Cell, cell
      assert_instance_of String, cell.coordinate
    end
  end

  def test_it_can_validate_coordinates
    board = Board.new

    assert_equal true, board.valid_coordinate?("A1")
    assert_equal true, board.valid_coordinate?("D4")
    assert_equal false, board.valid_coordinate?("A5")
    assert_equal false, board.valid_coordinate?("E1")
    assert_equal false, board.valid_coordinate?("A22")
  end

  def test_it_can_validate_placement_length_of_ship
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    assert_equal false, board.valid_placement?(cruiser, ["A1", "A2"])
    assert_equal false, board.valid_placement?(submarine, ["A2", "A3", "A4"])
  end

  def test_it_can_validate_placement_consecutive_coordinates
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    assert_equal true, board.valid_placement?(cruiser, ["A1", "A2", "A3"])
    assert_equal true, board.valid_placement?(cruiser, ["A1", "B1", "C1"])
    assert_equal false, board.valid_placement?(cruiser, ["A1", "A2", "A4"])
    assert_equal false, board.valid_placement?(submarine, ["A1", "C1"])
    assert_equal false, board.valid_placement?(cruiser, ["A3", "A2", "A1"])
    assert_equal false, board.valid_placement?(submarine, ["C1", "B1"])
  end

  def test_it_can_determine_validity_of_coordinate_array
    board = Board.new
    assert_equal true, board.valid_coordinate_array?(["A1", "A2", "A3"])
    assert_equal false, board.valid_coordinate_array?(["A1", "A2", "A4"])
  end

  def test_it_can_determine_if_letters_are_consecutive
    board = Board.new
    assert_equal true, board.consecutive_letters?(["A1", "B1", "C1"])
    assert_equal false, board.consecutive_letters?(["A1", "A1", "C1"])
  end

  def test_it_can_determine_if_numbers_are_consecutive
    board = Board.new
    assert_equal true, board.consecutive_numbers?(["A1", "A2", "A3"])
    assert_equal false, board.consecutive_numbers?(["A1", "A2", "A4"])
  end

  def test_it_can_invalidate_diagonal_placement
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    assert_equal false, board.valid_placement?(cruiser, ["A1", "B2", "C3"])
    assert_equal false, board.valid_placement?(submarine, ["C2", "D3"])
  end

  def test_it_can_place_ships
    skip
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
  
  end

  def test_it_can_render_default
    skip
    board = Board.new
    board.render

    # use string methods to test that the basic board at start of game is...
    #since it will always start 1234 A A1 can we test that?
    assert_equal
  end

  def test_it_can_render_show_true
    skip
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    board.render(true)

  end

  def test_it_can_render_with_hits
    skip
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    cruiser.hit
    board.render

  end

  #write tests for H and X

  def test_it_can_render_sunken_ships
    skip
    board = Board.new
    cruiser = Ship.new("Cruiser", 1)
    cruiser.hit
    board.render
  end
end
