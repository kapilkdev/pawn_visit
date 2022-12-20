require 'rspec'
require './path_finder'

describe PathFinder do
  let(:board_size) { 8 }
  let(:path_finder) { PathFinder.new(board_size) }
  let(:board) { instance_double(Board) }
  let(:algorithm) { instance_double(WarnsdorffAlgorithm) }
  let(:start_row) { 2 }
  let(:start_col) { 3 }

  before do
    allow(Board).to receive(:new).with(board_size).and_return(board)
    allow(WarnsdorffAlgorithm).to receive(:new).with(board).and_return(algorithm)
  end

  describe '#initialize' do
    it 'creates a new board with the specified size' do
      expect(Board).to receive(:new).with(board_size)
      path_finder
    end

    it 'creates a new WarnsdorffAlgorithm with the board' do
      expect(WarnsdorffAlgorithm).to receive(:new).with(board)
      path_finder
    end
  end

  describe '#find_path' do
    it 'calls find_path on the algorithm with the start row and column' do
      expect(algorithm).to receive(:find_path).with(start_row, start_col)
      path_finder.find_path(start_row, start_col)
    end
  end
end
