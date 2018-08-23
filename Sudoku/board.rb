class Board
  attr_accessor :grid
  
  def self.from_file(path)
    array = Array.new(9) {Array.new(9)}
    File.foreach(path) do |line|
      line.delete("\n")
      num_array = line.chars.map(&:to_i)
      array << num_array
    end
    Board.new(array)
  end
  
  def initialize(grid)
    @grid = grid
  end
  
  def render
    (0...9).each do |row|
      (0...9).each do |col|
        print @grid[row][col].value
      end 
      print "\n"
    end
  end
  
  def solved?
    # check each row
    @grid.each do |row|
      return false if !has_all_numbers(row)
    end
    
    # check each col 
    (0..8).each do |col|
      col_arr = []
      (0..8).each do |row|
        col_arr << @grid[row][col]
      end
      return false if !has_all_numbers?(col_arr)
    end 
    
    # check each square
    
  end
  
  def has_all_numbers?(arr)
     (1..9).each do |num|
       return false if !arr.include?(num)
     end
     return true
  end
  
end