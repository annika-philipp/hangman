class WordToGuess

  def initialize(hsh = {})
    @view             = hsh[:view]
    @word             = hsh[:word]
    @word_to_guess    = @word.downcase
    @word_to_display  = @word.chars
    @correct_letters_guessed = []
    @wrong_letters_guessed = []
  end
  def hello
    puts "Hello from word to guess"
  end

  def input_valid?(input)
    input.match(/[a-zA-Z]/) && !duplicate?(input)
  end

  def duplicate?(letter)
    if @wrong_letters_guessed.include?(letter) || @correct_letters_guessed.include?(letter)
      @view.duplicate_letter_message
    end
  end

  def letter_in_word(answer)
    if word_to_guess.include?(answer)
      @correct_letters_guessed.push(answer)
      @correct_letters_guessed.push(answer.upcase)
      true
    else
      @wrong_letters_guessed.push(answer)
      false
    end
  end
end
