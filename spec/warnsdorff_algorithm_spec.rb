require 'rspec'
require './invalid_position_error'
require './warnsdorff_algorithm'
require './board'

RSpec.describe WarnsdorffAlgorithm do
  let(:board) { double('board') }
  subject { described_class.new(board) }

  describe '#find_path' do
    context 'when the starting position is valid' do
      before do
        allow(board).to receive(:size).and_return(8)
        allow(board).to receive(:mark_visited)
        allow(board).to receive(:valid_move?).and_return(true)
      end

      it 'returns a valid path' do
        start_row = 0
        start_col = 0
        path = subject.find_path(start_row, start_col)

        expect(path).to be_an(Array)
        expect(path.size).to eq(board.size * board.size)

        visited_cells = path.map { |cell| [cell[0], cell[1]] }
        expect(visited_cells.uniq).to eq(visited_cells)

        invalid_cells = visited_cells.reject { |cell| board.valid_move?(cell[0], cell[1]) }
        expect(invalid_cells).to be_empty, "Invalid cells found: #{invalid_cells.inspect}"
      end
    end

    context 'when the starting position is invalid' do
      before do
        allow(board).to receive(:valid_move?).and_return(false)
      end

      it 'raises an InvalidPositionError' do
        start_row = -1
        start_col = 0

        expect { subject.find_path(start_row, start_col) }.to raise_error(InvalidPositionError, 'Invalid starting position')
      end
    end
  end
end
