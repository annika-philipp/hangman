class WordToGuess

  def initialize(word)
    @word               = word
    @word_to_guess      = word.downcase
    @word_to_display    = word.chars
  end
  def hello
    puts "Hello from word to guess"
  end
end
