require './invalid_position_error'

class WarnsdorffAlgorithm
  def initialize(board)
    @board = board
    @moves = [[0, 3], [3, 0], [2, 2], [-3, 0], [0, -3], [-2, -2], [-2, 2], [2, -2]]
  end

  def find_path(start_row, start_col)
    validate_position(start_row, start_col)

    path = [[start_row, start_col]]
    @board.mark_visited(start_row, start_col)
    
    (@board.size * @board.size - 1).times do
      next_moves = get_next_moves(path.last[0], path.last[1])
      next_move = choose_next_move(next_moves)
      return nil if next_move.nil?
      
      path << next_move
      @board.mark_visited(next_move[0], next_move[1])
    end

    path
  end

  private

  def get_next_moves(row, col)
    moves = []

    @moves.each do |move|
      new_row = row + move[0]
      new_col = col + move[1]

      moves << [new_row, new_col] if @board.valid_move?(new_row, new_col)
    end

    moves
  end

  def choose_next_move(moves)
    ranked_moves = moves.map { |move| [move, get_next_moves(move[0], move[1]).count] }
    ranked_moves.min_by { |_move, count| count }&.first
  end

  def validate_position(row, col)
    raise InvalidPositionError, 'Invalid starting position' unless @board.valid_move?(row, col)
  end
end
