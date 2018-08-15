require 'pry'

class Game 
  attr_accessor :board, :player_1, :player_2
  attr_reader 
  
  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
  ]
  
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end 
  
  #state of game methods
   def current_player
    board.turn_count % 2 == 0 ? player_1 : player_2
  end 
  
  def won?
    WIN_COMBINATIONS.detect do |combo| 
      board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[1]] == board.cells[combo[2]] && board.taken?(combo[0] + 1) 
    end
  end 
  
  def draw?
    !won?  && @board.full?
  end
  
  def over?
    won? || draw?
  end
  
  def winner
    if won? == nil
      nil
    elsif board.cells[won?[0]] == "O"
      "O"
    elsif board.cells[won?[0]] == "X"
      "X"
    end 
  end 
  
  #managing game methods 
  def start 
    
  end 
  
  def play
    while !over?
      turn 
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?  
      puts "Cat's Game!"
    end
  end 
  
  def turn 
   puts "Please enter 1-9:"
   p_input = current_player.move(board)
   if board.valid_move?(p_input)
     board.update(p_input, self.current_player)
   else
     turn 
   end
    board.display
  end
 
end 
