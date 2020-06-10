board = ["   ", "   ", "   ", "   ", "   ", "   ", "   ", "   ", "   "]
def display_board(board)

  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end
board = ["   ", "   ", "   ", "   ", "   ", "   ", "   ", "   ", "   "]

def input_to_index(user_input = "X")
  user_input.to_i - 1
  end

def move(board, index, win = "X")
  board[index] = win

  end

  def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board, index)
    move(board, index, player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  counter = 0
  board.each {|space|
    if space == "X" || space == "O"
      counter += 1
    end
  }
  counter
end


def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,4,8], [2,4,6], [0,3,6], [1,4,7], [2,5,8]]

def won?(board)
  WIN_COMBINATIONS.each do |combo|

  if board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]] && position_taken?(board, combo[0])
    return combo

    end
  end
  false
end

def full?(board)
  if board.any? {|index| index == nil || index == " "}
    return false
  else
    return true
  end
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  else !full?(board) && !won?(board)
    return false
  end
end

def over?(board)
  if draw?(board) || won?(board) || full?(board)
    return true
  else
    return false
  end
end

# The `#winner` method should accept a board and return the token, "X" or "O" that
# has won the game given a winning board.
def winner(board)
  winning_combo = won?(board)
  if winning_combo
    return board[winning_combo[0]]
 end
end
