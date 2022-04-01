require_relative '../lib/board.rb'

board = Board.new
board.display

while board.win != true
    puts 'Yellow player - Enter a column num: '
    input = gets.chop.to_i
    board.fill_in(input, board.yellow)
    board.win
    board.display

    puts 'Blue player - Enter a column num: '
    input = gets.chop.to_i
    board.fill_in(input, board.blue)
    board.win
    board.display
end