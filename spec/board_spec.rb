require_relative '../lib/board.rb'

describe Board do
  describe '#initilize' do
    it 'creates the board' do
      game_board = Board.new
      expect(game_board.board).not_to be(nil)
    end
  end
  
    
end