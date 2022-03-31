class Board
  attr_reader :board, :blue, :yellow

  def initialize
    @board = Array.new(6) { Array.new(7) { |i|  0 }  }
    @yellow = "\e[33m\u25cf\e[0m"
    @blue = "\e[34m\u25cf\e[0m"
  end

  def fill_in(column, token)
    (0..6).reverse_each do |row|
      if board[row-1][column-1] == 0
        board[row-1][column-1] = token
        break
      end
    end
  end

  def display
    # Prints the column numbers.
    slot_nums
    
    # Prints the whole board.
    (0...6).each do |row|
      (0...7).each do |col|
        print " #{ board[row][col] } "
      end
      puts ""
    end
    puts "\n "
  end

  private

  def slot_nums
    # Number the columns.
    slot_numbers = ""
    line = ""
    (0..6).each do |num|
      slot_numbers << " #{num+1} "
      line << "———"
    end
    puts line
    puts slot_numbers
    puts line
  end
end



# x = Board.new
# x.fill_in(5, x.blue)
# x.display
# x.fill_in(7, x.yellow)
# x.fill_in(7, x.yellow)
# x.fill_in(6, x.blue)

# x.display
