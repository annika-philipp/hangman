require_relative 'hangman_game'
require_relative 'word'
require_relative 'user_input'
require_relative 'view'


class Controller
  def initialize
    @view       = View.new
    @word       = Word.new(secret_word: "PizZa")
    @hangman    = Hangman.new(lives: 8, word: @word)
    @user_input = UserInput.new
  end

  def play
    @view.welcome

    while @hangman.running?

      @view.show_stats(@hangman.remaining_lives, @word.wrong_letters_guessed)
      @view.display_hidden_word(@word.secret_word_to_display, @word.correct_letters_guessed, @word.wrong_letters_guessed)
      @view.ask_for_input
      input = @user_input.get_input

      if @word.input_valid?(input)

        if @hangman.take_turn(input) == true
          @view.correct_letter_guessed(input)
        else 
          @view.wrong_letter_guessed(input)
        end

      else 

        if @word.duplicate_letter?(input)
          @view.duplicate_letter_message
        else
          @view.invalid_input_message(input)
        end
        
      end 

    end

    if @hangman.game_won?
      @view.game_won_message(@word.secret_word)
    else
      @view.game_lost_message(@word.secret_word)
    end

  end

end

c = Controller.new
c.play
