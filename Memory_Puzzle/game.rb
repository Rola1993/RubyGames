require_relative "card"
require_relative "board"
require_relative "human"

class Game
  attr_accessor :board, :previous_guess
  
  def initialize(cards, board_size)
    @board = Board.new(board_size)
    @board.populate(cards)
    @previous_guess = nil
  end
  
  def play 
    while true
      system("clear")
      @board.render
      puts "Please guess a position for the first card? (0,0)"
      guess_pos = gets.chomp.split(",")
      guess_pos[0] = guess_pos[0].to_i
      guess_pos[1] = guess_pos[1].to_i
      make_guess(guess_pos)
      puts "Please guess a position for the second card? (0,0)"
      guess_pos = gets.chomp.split(",")
      guess_pos[0] = guess_pos[0].to_i
      guess_pos[1] = guess_pos[1].to_i
      make_guess(guess_pos)
      break if @board.won?
    end
  end
  
  def make_guess(guess_pos)
    if @previous_guess == nil
      guess_card = @board.grid[guess_pos.first][guess_pos.last]
      guess_card.reveal
      @previous_guess = guess_card
    else
      guess_card = @board.grid[guess_pos.first][guess_pos.last]
      if @previous_guess.face_value == guess_card.face_value
        guess_card.reveal
        @previous_guess = nil
      else 
        guess_card.reveal
        @board.render
        sleep(2)
        guess_card.hide
        previous_guess.hide
        @previous_guess = nil
      end
    end
  end
  
end

if __FILE__ == $PROGRAM_NAME
  puts "What dimension square grid? Input an even number eg.(4)"
  while true
    num = gets.chomp.to_i
    if num.odd?
      puts "Invalid input! Please input a even number."
    else
      board_size = num 
      break
    end
  end
  letters = ('A'..'Z').to_a.sample(board_size*board_size/2)
  letters += letters
  letters = letters.shuffle
  cards = []
  letters.each do |e|
    cards.push(Card.new(e))
  end 
  game = Game.new(cards, board_size)
  game.play
end 