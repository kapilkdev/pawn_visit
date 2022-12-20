require 'rspec'
require './board'

describe Board do
  let(:board_size) { 8 }
  let(:board) { Board.new(board_size) }

  describe '#initialize' do
    it 'creates a board with the specified size' do
      expect(board.size).to eq(board_size)
    end
    
    it 'raises an InvalidBoardSizeError' do
      expect { Board.new(-1) }.to raise_error(InvalidBoardSizeError, 'Invalid board size')
    end
  end

  describe '#valid_move?' do
    it 'returns true for a valid move' do
      expect(board.valid_move?(2, 3)).to be_truthy
    end

    it 'returns false for an invalid move' do
      board.mark_visited(2, 3)
      expect(board.valid_move?(2, 3)).to be_falsey
    end
  end

  describe '#mark_visited' do
    it 'marks the specified cell as visited' do
      board.mark_visited(2, 3)
      expect(board.valid_move?(2, 3)).to be_falsey
    end
  end

  describe '#mark_unvisited' do
    it 'marks the specified cell as unvisited' do
      board.mark_visited(2, 3)
      board.mark_unvisited(2, 3)
      expect(board.valid_move?(2, 3)).to be_truthy
    end
  end
end
