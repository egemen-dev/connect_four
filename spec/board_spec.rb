require_relative '../lib/board.rb'

describe Board do
  describe '#initilize' do
    subject(:game_board) { Board.new }

    it 'creates the board' do
      expect(game_board.board).not_to be(nil)
    end
  end

  describe '#fill_in' do
    context 'when player drops the yellow coin on column 3' do
      subject(:board) { Board.new }

      it 'column 3, row 6 yellow token' do
        board.fill_in(3, board.yellow)
        expect(board.board[5][2]).to eq(board.yellow)
      end

      it 'column 3, row 6 yellow (not blue) token' do
        board.fill_in(3, board.yellow)
        expect(board.board[5][2]).not_to eq(board.blue)
      end

      it 'other places stay empty' do
        board.fill_in(6, board.yellow)
        expect(board.board[5][6]).to eq(0)
      end
    end

    context 'when different coins inserted on top of each other' do
      subject(:board) { Board.new }

      before do
        board.fill_in(7, board.yellow)
        board.fill_in(7, board.yellow)
        board.fill_in(7, board.blue)
      end

      it 'do not over write each other (row 6, column 7 = yellow)' do
        expect(board.board[5][6]).to eq(board.yellow)
      end

      it 'do not over write each other (row 5, column 7 = yellow)' do
        expect(board.board[4][6]).to eq(board.yellow)
      end

      it 'do not over write each other (row 4, column 7 = blue)' do
        expect(board.board[3][6]).to eq(board.blue)
      end

      it 'do not over write each other (row 3, column 7 = empty)' do
        expect(board.board[2][6]).to eq(0)
      end
    end
  end

  describe '#win' do
    subject(:board) { Board.new }

    context 'if board is empty' do
      it 'false - no wins' do
        expect(board.win).to be(false)
      end
    end

    context 'diagonal check from down to up' do
      before do
        board.fill_in(1, board.blue)
        board.fill_in(2, board.yellow)
        board.fill_in(2, board.blue)
        board.fill_in(3, board.blue)
        board.fill_in(3, board.yellow)
        board.fill_in(3, board.blue)
        board.fill_in(4, board.yellow)
        board.fill_in(4, board.yellow)
        board.fill_in(4, board.yellow)
        board.fill_in(4, board.blue)
      end

      it 'ture - win' do
        expect(board.win).to be(true)
      end
    end

    context 'diagonal check from up to down' do
      before do
        board.fill_in(1, board.blue)
        board.fill_in(1, board.blue)
        board.fill_in(1, board.yellow)
        board.fill_in(1, board.blue)
        board.fill_in(1, board.blue)
        board.fill_in(1, board.yellow)
        board.fill_in(2, board.yellow)
        board.fill_in(2, board.yellow)
        board.fill_in(2, board.blue)
        board.fill_in(2, board.yellow)
        board.fill_in(2, board.yellow)
        board.fill_in(3, board.blue)
        board.fill_in(3, board.yellow)
        board.fill_in(3, board.blue)
        board.fill_in(3, board.yellow)
        board.fill_in(4, board.yellow)
        board.fill_in(4, board.yellow)
        board.fill_in(4, board.yellow)
        board.fill_in(4, board.blue)
      end

      it 'ture - win' do
        expect(board.diagonal_win).to be(true)
      end
    end

    context 'lateral check' do
      before do
        board.fill_in(7, board.yellow)
        board.fill_in(6, board.yellow)
        board.fill_in(5, board.yellow)
        board.fill_in(4, board.yellow)
      end

      it 'ture - win' do
        expect(board.win).to be(true)
      end
    end

    context 'vertical check' do
      before do
        board.fill_in(7, board.yellow)
        board.fill_in(7, board.yellow)
        board.fill_in(7, board.yellow)
        board.fill_in(7, board.yellow)
      end

      xit 'ture - win' do
        expect(board.win).to be(ture)
      end
    end
  end
end
