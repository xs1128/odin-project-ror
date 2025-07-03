# frozen_string_literal: true

class Game # rubocop:disable Style/Documentation
  @@winning_cond = [ # rubocop:disable Style/ClassVars
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

  def initialize(p1, p2) # rubocop:disable Naming/MethodParameterName
    @board = Array.new(3) { Array.new(3) }
    @p1 = p1
    @p2 = p2
    @curr = [p1, p2].sample
    @winner = nil
  end

  def check_win
    arr = @board.flatten
    @@winning_cond.any? do |indices|
      x, y, z = indices
      !arr[x].nil? && arr[x] == arr[y] && arr[y] == arr[z]
    end
  end

  def check_tie
    @board.flatten.none?(nil)
  end

  def check_end
    check_win || check_tie
  end

  def valid_move?(r, c) # rubocop:disable Naming/MethodParameterName
    r.between?(0, 2) && c.between?(0, 2) && @board[r][c].nil?
  end

  def action(str) # rubocop:disable Metrics/AbcSize,Metrics/MethodLength
    move = str.split('')
    # overwrite the board
    row = move[1].to_i - 1
    col = move[0].ord - 'A'.ord
    return puts 'Invalid move!' unless valid_move?(row, col)

    # Check if valid move
    @board[row][col] = @curr == @p1 ? 0 : 1

    if check_win
      @winner = @curr
    elsif check_tie
      @winner = nil
    else
      @curr = @curr == @p1 ? @p2 : @p1
    end
  end

  def display
    puts '    A   B   C'
    puts '  +---+---+---+'
    @board.each_with_index do |row, row_index|
      row_display = row.map { |cell| cell.nil? ? ' ' : cell }.join(' | ')

      puts "#{row_index + 1} | #{row_display} |"
      puts '  +---+---+---+'
    end
  end

  attr_reader :curr, :winner
end

puts "What's player 1's name?"
p1 = gets
puts "What's player 2's name?"
p2 = gets

ttt = Game.new(p1, p2)

until ttt.check_end
  ttt.display
  puts "#{ttt.curr.chomp}'s turn. Please type <alpha><num> for your move"
  move = gets
  ttt.action(move)
end

ttt.display
if ttt.winner
  puts "Winner is #{ttt.curr}"
else
  puts 'Its a tie'
end
