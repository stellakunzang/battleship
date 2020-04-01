require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'
require './lib/computer'
require 'mocha/minitest'
require 'pry'

class ComputerTest < Minitest::Test

  def test_it_exists
    computer = Computer.new

    assert_instance_of Computer, computer
  end

  def test_it_can_place_cruiser_randomly
    computer = Computer.new
    random_coordiantes = computer.random_coordinates_cruiser

    assert_equal true, computer.board.valid_placement?(computer.cruiser, random_coordiantes)
  end

  def test_it_can_place_the_cruiser
    skip
    computer = Computer.new
    random_coordiantes = computer.random_coordinates_cruiser
    # put assert_equal true since im not sure how to test randomness
    assert_equal true, computer.place_cruiser
  end

  def test_it_can_verify_sub_coordinates
    computer = Computer.new
    random_coordiantes = computer.random_coordinates_cruiser
    computer.place_cruiser
    sub_random_coordinates = computer.stubs(:random_coordinates_submarine).returns(["A1", "A2"])

    assert_equal true, computer.sub_coordinates_are_valid
  end

  def test_it_can_place_sub
    skip
    computer = Computer.new
    random_coordiantes = computer.random_coordinates_cruiser
    computer.place_cruiser
    sub_random_coordinates = computer.random_coordinates_submarine
    computer.sub_coordinates_are_valid
    # put assert_equal true since im not sure how to test randomness
    assert_equal true, computer.place_submarine
  end
end
