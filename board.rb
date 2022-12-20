require './invalid_board_size_error'

class Board
  attr_reader :size

  def initialize(size)
    raise InvalidBoardSizeError, 'Invalid board size' unless valid_board_size?(size)

    @size = size
    @cells = Array.new(size) { Array.new(size, false) }
  end

  def valid_move?(row, col)
    row.between?(0, size - 1) && col.between?(0, size - 1) && !@cells[row][col]
  end

  def mark_visited(row, col)
    @cells[row][col] = true
  end

  def mark_unvisited(row, col)
    @cells[row][col] = false
  end

  private

  def valid_board_size?(size)
    size.positive?
  end
end