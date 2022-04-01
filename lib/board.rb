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
        print " #{board[row][col]} "
      end
      puts ""
    end
    puts "\n "
  end

  def win
    lateral_win || vertical_win || diagonal_win
  end

  def vertical_win
    condition = false
    (0..2).each do |row|
      (0..6).each do |col|
        if board[row][col] != 0
          if board[row][col] == board[row + 1][col] \
            && board[row][col] == board[row + 2][col] \
            && board[row][col] == board[row + 3][col]
            puts "Player #{board[row][col]} won!"
            condition = true
          end
        end
      end
    end
    condition
  end

  def lateral_win
    condition = false
    (0..5).each do |row|
      (0...4).each do |col|
        if board[row][col] != 0
          if board[row][col] == board[row][col + 1] \
            && board[row][col] == board[row][col + 2] \
            && board[row][col] == board[row][col + 3]
            puts "Player #{board[row][col]} won!"
            condition = true
          end
        end
      end
    end
    condition
  end

  def diagonal_win
    condition = false
    # Going up and to the right.
    (3..5).each do |row|
      (0..3).each do |col|
        if board[row][col] != 0
          if board[row][col] == board[row - 1][col + 1] \
            && board[row][col] == board[row - 2][col + 2] \
            && board[row][col] == board[row - 3][col + 3]
            puts "Player #{board[row][col]} won!"
            condition = true
          end
        end
      end
    end
    # Going down and to the right.
    (0..3).each do |row|
      (0...4).each do |col|
        if board[row][col] != 0
          if board[row][col] == board[row + 1][col + 1] \
            && board[row][col] == board[row + 2][col + 2] \
            && board[row][col] == board[row + 3][col + 3]
            puts "Player #{board[row][col]} won!"
            condition = true
          end
        end
      end
    end
    condition
  end

  private

  def slot_nums
    # Number the columns.
    slot_numbers = ""
    line = ""
    (0..6).each do |num|
      slot_numbers << " #{num + 1} "
      line << "———"
    end
    puts line
    puts slot_numbers
    puts line
  end
end

x = Board.new
x.fill_in(1, x.blue)
x.fill_in(1, x.blue)
x.fill_in(1, x.yellow)
x.fill_in(1, x.blue)
x.fill_in(1, x.blue)
x.fill_in(1, x.yellow)
x.fill_in(2, x.yellow)
x.fill_in(2, x.yellow)
x.fill_in(2, x.blue)
x.fill_in(2, x.yellow)
x.fill_in(2, x.yellow)
x.fill_in(3, x.blue)
x.fill_in(3, x.yellow)
x.fill_in(3, x.blue)
x.fill_in(3, x.yellow)
x.fill_in(4, x.yellow)
x.fill_in(4, x.yellow)
x.fill_in(4, x.yellow)
x.fill_in(4, x.blue)
p x.diagonal_win
x.display
