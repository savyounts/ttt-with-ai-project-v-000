class Board 
  attr_accessor :cells
  
  def initialize (player_1, player_2)
    reset!
  end
  
  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end 
  
  def display
   puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
   puts "-----------"
   puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
   puts "-----------"
   puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end 
    
  def position(x)
    index = x.to_i 
    index -= 1
    @cells[index]
  end 
  
  def update(x, player)
    index = x.to_i 
    index -= 1
    @cells[index] = player.token
  end 
  
  def full?
    @cells.none?{|c| c == " "}
  end 
 
 def turn_count
    count = 0 
    @cells.each {|c| count += 1 if c == "X" || c == "O"}
    count
  end
 
 def taken?(x) 
   position(x) == "X" || position(x) == "O" 
 end
 
 def valid_move?(x)
   !taken?(x) && x.to_i.between?(1,9)
 end 
 
   
  
  
end 