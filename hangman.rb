class HangmanGame
  attr_reader :word_to_guess
  def initialize(word)
    @word_to_guess = word
    @word_to_display = word.chars
  end

  def play_game
    mask_letters
    puts "playing game"
  end

  def mask_letters
    hidden_word = @word_to_display.map do |letter| 
        "_" 
    end
    puts hidden_word.join(" ")
  end


  puts "Hello, time to play hangman"

end

# HangmanGame.new("pizza").mask_letters
h = HangmanGame.new("pizza")
h.play_game