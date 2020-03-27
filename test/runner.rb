#runner for itteration 2

require './lib/board'
require './lib/ship'
require 'pry';

board = Board.new
board.cells
board.valid_coordinate?("A1")
board.valid_coordinate?("D4")
board.valid_coordinate?("A5")
board.valid_coordinate?("E1")
board.valid_coordinate?("A22")

cruiser = Ship.new("Cruiser", 3)
submarine = Ship.new("Submarine", 2)

board.valid_placement?(cruiser, ["A1", "A2"])
board.valid_placement?(submarine, ["A2", "A3", "A4"])

board.valid_placement?(cruiser, ["A1", "A2", "A4"])
board.valid_placement?(submarine, ["A1", "C1"])
board.valid_placement?(cruiser, ["A3", "A2", "A1"])
board.valid_placement?(submarine, ["C1", "B1"])
board.valid_placement?(cruiser, ["A1", "B2", "C3"])
board.valid_placement?(submarine, ["C2", "D3"])
board.valid_placement?(submarine, ["A1", "A2"])
board.valid_placement?(cruiser, ["B1", "C1", "D1"])

p board.place(cruiser, ["A1", "A2", "A3"])
binding.pry
# p board.place(cruiser, ["D4"])
# p board.cells["A1", "A2", "A3"]
# p board.cells["A1", "A2", "A3"].coordinate

cell_1 = board.cells["A1"]
cell_2 = board.cells["A2"]
cell_3 = board.cells["A3"]
cell_1.ship
cell_2.ship
cell_3.ship
cell_3.ship == cell_2.ship
