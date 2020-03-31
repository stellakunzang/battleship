require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/turn'
#require './lib/game'
require 'pry'

class TurnTest < Minitest::Test

  def test_it_exists
    turn = Turn.new

    assert_instance_of Turn, turn
  end

  def test_it_has_attributes
    turn = Turn.new

    assert_equal [], turn.player_cells_fired_upon
    assert_equal Array, turn.computer_target_coordinates.class
    assert_equal 16, turn.computer_target_coordinates.length
  end
  
end
