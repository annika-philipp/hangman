require_relative 'hangman_game'
require_relative 'word'
require_relative 'user_input'
require_relative 'view'


class Controller
  def initialize
    @view       = View.new
    @word       = Word.new(secret_word: "pizza")
    @hangman    = Hangman.new(lives: 8, word: @word)
    @user_input = UserInput.new
  end

  def play
    welcome
    while @hangman.running?
      interact_with_user
      check_input_validity(@input)
    end
    game_over_status
  end

  private
  
  def welcome
    @view.welcome
  end

  def interact_with_user  
    show_stats
    show_secret_word
    ask_user_input
    user_input
  end

  def show_stats
    @view.show_stats(@hangman.remaining_lives, @word.wrong_letters_guessed)
  end

  def show_secret_word
    @view.display_hidden_word(@word.secret_word_to_display, @word.correct_letters_guessed, @word.wrong_letters_guessed)
  end

  def ask_user_input
    @view.ask_for_input
  end

  def user_input
    @input = @user_input.get_input
  end

  def check_input_validity(input)
    return play_turn(input) if @word.input_valid?(input)
    input_invalid(input)
  end

  def input_invalid(input)
    return @view.duplicate_letter_message if @word.duplicate_letter?(input)
    @view.invalid_input_message(input)
  end

  def play_turn(input)
    return @view.correct_letter_guessed(input) if @hangman.take_turn(input)
    @view.wrong_letter_guessed(input)
  end

  def game_over_status
    return @view.game_won_message(@word.secret_word) if @hangman.game_won?
    @view.game_lost_message(@word.secret_word)
  end

end

c = Controller.new
c.play
