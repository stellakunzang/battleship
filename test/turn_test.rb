require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship.rb'
require './lib/turn.rb'
require 'pry';



class TurnTest < Minitest::Test

  def test_it_exists


    assert_instance_of Turn, turn.new
  end


end
