# Helper Methods
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, current_player = "X")
  board[index] = current_player
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip.to_i
  index = input_to_index(input)

  if valid_move?(board, index)
    move(board, index)
    display_board(board)
  else
    puts "Invalid move, try again!"
    turn(board)
  end
end

def play(board)
  for input in 1..9 do
    turn(board)
  end
end

#Once you get all the tests passing, your `#play` loop should be looking pretty good. However, there are two issues with it. First, the turns do not switch between "X" and "O" tokens. Second, the game does not terminate when a player wins. Take a moment and brainstorm––what are some ways in which we could tell our game to switch tokens according to whose turn it is? How could we determine if and when a certain player has won?
