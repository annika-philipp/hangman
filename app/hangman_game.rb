# require 'byebug'

class Hangman
  attr_reader :word, :word_to_guess, :word_to_display

  def initialize(hsh = {})
    @word = hsh[:word]
    @initial_lives = hsh[:lives]
    @view = hsh[:view]
    @word_to_guess = word.downcase
    @word_to_display = word.chars
    @correct_letters_guessed = []
    @wrong_letters_guessed = []
  end

  def running?    
    @view.show_stats(remaining_lives, @wrong_letters_guessed)
    !game_lost? || !game_won?
  end

  def game_won?
    if word_to_display - @correct_letters_guessed == []
      @view.game_won_message(word)
      true
    end
  end

  def game_lost?
    if remaining_lives == 0
      @view.game_lost_message(word)
      true
    end
  end

  def remaining_lives
    @initial_lives - @wrong_letters_guessed.size
  end

  def hide_word
    @view.mask_letters(word_to_display, @correct_letters_guessed, @wrong_letters_guessed)
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

  def letter_in_word(answer)
    if word_to_guess.include?(answer)
      @correct_letters_guessed.push(answer)
      @correct_letters_guessed.push(answer.upcase)
      @view.correct_letter_guessed(answer)
    else
      @wrong_letters_guessed.push(answer)
      @view.wrong_letter_guessed(answer)
    end
  end

end

# allows for all kindsa unicode, å, ß, ø etc.
# if input.match(/\p{L}\p{M}*+/).nil? 

