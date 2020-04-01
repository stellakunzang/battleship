require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'
require './lib/computer'
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
    computer = Computer.new
    computer.stubs(:random_coordinates_cruiser).returns(["A1", "A2", "A3"])

    assert_equal ["A1", "A2", "A3"], computer.place_cruiser
#     random_coordiantes = computer.random_coordinates_cruiser
#     # put assert_equal true since im not sure how to test randomness
#     assert_equal true, computer.place_cruiser

  end

  def test_it_can_verify_sub_coordinates
    computer = Computer.new
    random_coordiantes = computer.random_coordinates_cruiser
    computer.place_cruiser
    sub_random_coordinates = computer.stubs(:random_coordinates_submarine).returns(["A1", "A2"])

    assert_equal true, computer.sub_coordinates_are_valid
  end

  def test_it_can_place_sub

    computer = Computer.new
    random_coordiantes = computer.random_coordinates_cruiser
    computer.place_cruiser
    sub_random_coordinates = computer.stubs(:random_coordinates_submarine).returns(["A1", "A2"])
    computer.sub_coordinates_are_valid

    assert_equal ["A1", "A2"], computer.place_submarine

   
#     sub_random_coordinates = computer.random_coordinates_submarine
#     computer.sub_coordinates_are_valid
#     # put assert_equal true since im not sure how to test randomness
#     assert_equal true, computer.place_submarine

  end

  def test_it_can_create_computer_targets
    computer = Computer.new
    assert_equal Array, computer.computer_target_coordinates.class
    assert_equal 16, computer.computer_target_coordinates.length
  end
end
