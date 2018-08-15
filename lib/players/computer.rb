module Players
class Computer < Player
  
  def move(board)
    ["1", "2", "3", "4", "5", "6", "7", "8", "9"].sample
    #first turn choose corner
    #second turn choose other corner
    
    if board.turn_count
  end
end 
end
