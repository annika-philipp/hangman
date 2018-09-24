# require 'byebug'

class Hangman
  attr_reader :word, :word_to_guess, :word_to_display

  def initialize(hsh = {})
    @word = hsh[:word]
    @lives = hsh[:lives]
    @view = hsh[:view]
    @word_to_guess = word.downcase
    @word_to_display = word.chars
    @correct_letters_guessed = []
    @wrong_letters_guessed = []
  end

  def running?    
    # @view.lives_remaining_message(@lives)
    # @view.incorrect_letters(@wrong_letters_guessed)
    !game_won? || !game_lost?
  end

  def game_won?
    if word_to_display - @correct_letters_guessed == []
      @view.game_won_message(word)
      true
    end
  end

  def game_lost?
    if @lives == 0
      @view.game_lost_message(word)
      true
    end
  end

  def hide_word
    @view.mask_letters(word_to_display, @correct_letters_guessed)
  end

  def input_valid?(input)
    input.match(/[a-zA-Z]/) && !duplicate?(input)
  end

  def duplicate?(letter)
    if @wrong_letters_guessed.include?(letter) || @correct_letters_guessed.include?(letter)
      @view.duplicate_letter_message
    end
  end

  def take_turn(input)
    letter_in_word(input)
  end

  # Annika think about this!
  # def lives
  #   initial_lives - incorrect_letters.size
  # end

  def letter_in_word(answer)
    if word_to_guess.include?(answer)
      @correct_letters_guessed.push(answer)
      @correct_letters_guessed.push(answer.upcase)
      @view.correct_letter_guessed(answer)
    else
      reduce_life
      @wrong_letters_guessed.push(answer)
      @view.wrong_letter_guessed(answer)
    end
  end

  def reduce_life
    @lives -= 1
  end

end

# allows for all kindsa unicode, å, ß, ø etc.
# if input.match(/\p{L}\p{M}*+/).nil? 

