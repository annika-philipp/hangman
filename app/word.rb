class Word

  attr_reader :secret_word, :secret_word_to_guess, :secret_word_to_display, :wrong_letters_guessed, :correct_letters_guessed

  def initialize(hsh = {})
    @secret_word              = hsh[:secret_word]
    @secret_word_to_guess     = @secret_word.downcase
    @secret_word_to_display   = @secret_word.chars
    @correct_letters_guessed  = []
    @wrong_letters_guessed    = []
  end

  def input_valid?(input)
    input_valid_letter?(input) && !duplicate_letter?(input)
  end

  def input_valid_letter?(input)
    input.match(/[a-zA-Z]/)
  end

  def duplicate_letter?(letter)
    wrong_letters_guessed.include?(letter) || correct_letters_guessed.include?(letter)
  end

  def letter_in_word(answer)
    if secret_word_to_guess.include?(answer)
      correct_letters_guessed.push(answer)
      true
    else
      wrong_letters_guessed.push(answer)
      false
    end
  end

end
