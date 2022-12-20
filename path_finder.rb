require "./warnsdorff_algorithm"
require "./board"

class PathFinder
  def initialize(board_size)
    @board = Board.new(board_size)
    @algorithm = WarnsdorffAlgorithm.new(@board)
  end

  def find_path(start_row, start_col)
    @algorithm.find_path(start_row, start_col)
  end
end