# require 'byebug'

class Hangman

  def initialize(hsh = {})
    @initial_lives = hsh[:lives]
    @word = hsh[:word]
  end

  def running? 
    !game_over?
  end

  def game_over?
    game_won? || game_lost?
  end

  def game_won?
    @word.secret_word_to_display - @word.correct_letters_guessed == []
  end

  def game_lost?
    remaining_lives == 0
  end

  def remaining_lives
    @initial_lives - @word.wrong_letters_guessed.size
  end

  def take_turn(answer)
    @word.letter_in_word(answer)
  end

  # private

end

# allows for all kindsa unicode, å, ß, ø etc.
# if input.match(/\p{L}\p{M}*+/).nil? 

