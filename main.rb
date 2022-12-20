require './path_finder'
require './invalid_position_error'
require './invalid_board_size_error'

class Main
  def initialize(board_size)
    @finder = PathFinder.new(board_size)
  end

  def run(start_row, start_col)
    begin
      path = @finder.find_path(start_row, start_col)
      if path.nil?
        puts 'No valid path found.'
      else
        puts 'Path found:'
        result = path.map { |move| [move[0], move[1]] }
        print(result)
        puts
      end
    rescue InvalidPositionError, InvalidBoardSizeError => e
      puts "Error: #{e.message}"
    end
  end
end

app = Main.new(10)
app.run(3,2)
