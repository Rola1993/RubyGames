class Ghost
  attr_accessor :player1, :player2, :fragment, :dictionary

  def initialize(player1, player2, dictionary)
    @player1 = player1
    @player2 = player2
    @fragment = ''
    @dictionary = dictionary # should be a set
  end

  def play_round

  end

  def next_player! # switches the values of current_player and previous_player

  end

  def take_turn(player)
    guess_letter = player.guess
    while !valid_play?(guess_letter)
      guess_letter = player.guess
    end
    @fragment += guess_letter
    puts "You lose!" if @dictionary.include?(@fragment)
  end

  def valid_play?(string)
    ('a'..'z').to_a.include?(string)
  end

end

class Player
  attr_accessor :guess_letter, :name

  def initialize(name)
    @name = name
  end

  def guess
    @guess_letter = gets.chomp
  end

  def alert_invalid_guess

  end

end
