require 'rspec'
require './path_finder'
require './invalid_position_error'
require './invalid_board_size_error'
require './main'

RSpec.describe Main do
  let(:finder) { instance_double(PathFinder) }
  subject { described_class.new(10) }

  before do
    allow(PathFinder).to receive(:new).and_return(finder)
  end

  describe '#run' do
    context 'when a valid path is found' do
      it 'prints the path' do
        start_row = 9
        start_col = 9
        path = [[9, 9], [7, 8], [9, 7], [8, 5], [6, 6], [8, 7], [9, 5], [7, 4], [5, 5], [7, 6], [9, 5], [7, 6], [9, 7], [7, 8], [9, 9]]

        allow(finder).to receive(:find_path).with(start_row, start_col).and_return(path)

        expect { subject.run(start_row, start_col) }.to output("Path found:\n[[9, 9], [7, 8], [9, 7], [8, 5], [6, 6], [8, 7], [9, 5], [7, 4], [5, 5], [7, 6], [9, 5], [7, 6], [9, 7], [7, 8], [9, 9]]\n").to_stdout
      end
    end

    context 'when no valid path is found' do
      it 'prints an error message' do
        start_row = 9
        start_col = 9

        allow(finder).to receive(:find_path).with(start_row, start_col).and_return(nil)

        expect { subject.run(start_row, start_col) }.to output("No valid path found.\n").to_stdout
      end
    end

    context 'when an InvalidPositionError is raised' do
      it 'prints the error message' do
        start_row = -1
        start_col = 0

        allow(finder).to receive(:find_path).with(start_row, start_col).and_raise(InvalidPositionError, 'Invalid starting position')

        expect { subject.run(start_row, start_col) }.to output("Error: Invalid starting position\n").to_stdout
      end
    end

    context 'when an InvalidBoardSizeError is raised' do
      it 'prints the error message' do
        start_row = 0
        start_col = 0

        allow(finder).to receive(:find_path).with(start_row, start_col).and_raise(InvalidBoardSizeError, 'Invalid board size')

        expect { subject.run(start_row, start_col) }.to output("Error: Invalid board size\n").to_stdout
      end
    end
  end
end
