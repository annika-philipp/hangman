# require 'byebug'

class Hangman
  attr_reader :word, :word_to_guess, :word_to_display, :wrong_letters_guessed, :correct_letters_guessed

  def initialize(hsh = {})
    @word = hsh[:word]
    @initial_lives = hsh[:lives]
    @view = hsh[:view]
    @word_to_guess = word.downcase
    @word_to_display = word.chars
    @correct_letters_guessed = []
    @wrong_letters_guessed = []
  end

  # hangman
  def running?    
    !game_over?
  end

  # hangman
  def game_over?
    game_won? || game_lost?
  end

  # hangman
  def game_won?
    word_to_display - @correct_letters_guessed == []
  end

  # hangman
  def game_lost?
    remaining_lives == 0
  end

  # hangman
  def remaining_lives
    @initial_lives - wrong_letters_guessed.size
  end


  # word
  def input_valid?(input)
    input_valid_letter?(input) && !duplicate?(input)
  end

  def input_valid_letter?(input)
    input.match(/[a-zA-Z]/)
  end

  # word
  def duplicate?(letter)
    wrong_letters_guessed.include?(letter) || @correct_letters_guessed.include?(letter)
  end

  # hangman
  def take_turn(answer)
    letter_in_word(answer)
  end

  # word
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

  # private

end

# allows for all kindsa unicode, å, ß, ø etc.
# if input.match(/\p{L}\p{M}*+/).nil? 

