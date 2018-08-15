module Players
class Computer < Player
  
  def move(board)
    ["1", "2", "3", "4", "5", "6", "7", "8", "9"].sample
  end   
    #first turn choose corner
    #second turn choose other corner
    #Win: If you have two in a row, play the third to get three in a row.
    #Block: If the opponent has two in a row, play the third to block them.
    #Fork: Create an opportunity where you can win in two ways.
    #Block Opponent's Fork:
    
    def win  
      WIN_COMBINATIONS.each do |combo|
        if board.cells[combo[0]] == computer.token && board.cells[combo[0]] == board.cells[combo[1]] 
            combo[2]
        elsif board.cells[combo[0]] == computer.token && board.cells[combo[0]] == board.cells[combo[2]]
            combo[1]
        elsif board.cells[combo[2]] == computer.token && board.cells[combo[2]] == board.cells[combo[1]]
            combo[0]
        end
      end
    end 

    def block 
      WIN_COMBINATIONS.each do |combo|
        if board.cells[combo[0]] != computer.token && board.cells[combo[0]] != " " &&  board.cells[combo[0]] == board.cells[combo[1]] 
            combo[2]
        elsif board.cells[combo[0]] != computer.token && board.cells[combo[0]] != " " && board.cells[combo[0]] == board.cells[combo[2]]
            combo[1]
        elsif board.cells[combo[2]] != computer.token && board.cells[combo[2]] != " " && board.cells[combo[2]] == board.cells[combo[1]]
            combo[0]
        end
      end
    end
    
    def create_fork 
      case 
        when board.cells[0] == player.token && (board.cells[0] == board.cells[2] || board.cells[0] == board.cells[6] || board.cells[8] == board.cells[6] || board.cells[8] == board.cells[2])
           "4"
        when board.cells[0] == player.token && (board.cells[0] == board.cells[4] ||board.cells[8] == board.cells[4]
          ["2", "6"].sample
        when board.cells[2] == player.token && (board.cells[4] == board.cells[2] || board.cells[4] == board.cells[6])
          ["0", "8"].sample
      end
    end
  

end
end
