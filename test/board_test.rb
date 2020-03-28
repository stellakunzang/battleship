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

  def test_it_can_invalidate_overlapping_ships
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    board.place(cruiser, ["A1", "A2", "A3"])
    submarine = Ship.new("Submarine", 2)
    board.place(submarine, ["A3, B3"])

    assert_equal false, board.valid_placement
  end

  def test_it_can_render_default
    board = Board.new
    cell1 = board.cells["A1"]
    cell2 = board.cells["A2"]
    cell3 = board.cells["A3"]

    assert_equal ".", cell1.render
    assert_equal ".", cell2.render
    assert_equal ".", cell3.render
  end

  def test_it_can_render_show_true
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    board.place(cruiser, ["A1", "A2", "A3"])
    cell1 = board.cells["A1"]
    cell2 = board.cells["A2"]
    cell3 = board.cells["A3"]

    assert_equal ".", cell1.render
    assert_equal ".", cell2.render
    assert_equal ".", cell3.render

    assert_equal "S", cell1.render(true)
    assert_equal "S", cell2.render(true)
    assert_equal "S", cell3.render(true)
  end

  def test_it_can_render_hits_and_misses
    board = Board.new
    cruiser = Ship.new("Cruiser", 2)
    board.place(cruiser, ["A1", "A2"])
    cell1 = board.cells["A1"]
    cell2 = board.cells["A2"]
    cell3 = board.cells["A3"]
    cell2.fire_upon
    cell3.fire_upon

    assert_equal ".", cell1.render
    assert_equal "H", cell2.render
    assert_equal "M", cell3.render
  end

  def test_it_can_render_sunken_ships
    board = Board.new
    cruiser = Ship.new("Cruiser", 2)
    board.place(cruiser, ["A1", "A2"])
    cell1 = board.cells["A1"]
    cell2 = board.cells["A2"]
    cell1.fire_upon
    cell2.fire_upon

    assert_equal "X", cell1.render
    assert_equal "X", cell2.render
  end
end
