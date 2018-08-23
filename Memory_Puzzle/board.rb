require_relative "card"

class Board
  attr_accessor :grid
  
  def initialize(size)
    @grid = Array.new(size) { Array.new(size) }
  end
  
  def populate(cards)
    cards = cards.shuffle
    (0...@grid.length).each do |row| 
      (0...@grid.length).each do |col|
        @grid[row][col] = cards.pop
      end
    end
  end

  
  def render
    (0...@grid.length).each do |row|
      (0...@grid.length).each do |col|
        @grid[row][col].display_info
      end
      puts "\n"
    end
  end
  
  def won?
    (0...@grid.length).each do |row|
      (0...@grid.length).each do |col|
        return false if !@grid[row][col].face_up 
      end
    end
    
    puts "Game won"
    return true
  end
  
  def reveal(guessed_pos)
    guessed_card = @grid[guessed_pos.first][guessed_pos.last]
    guessed_card.reveal
    return guessed_card.face_value
  end
  
end
