require_relative 'hangman_game'
# require_relative 'word_to_guess'
require_relative 'user_input'
require_relative 'view'


class Controller
  def initialize
    @view       = View.new
    @hangman    = Hangman.new(word: "PizZa", lives: 8, view: @view)
    @user_input = UserInput.new
  end

  def play
    @view.welcome

    while @hangman.running?
      
      @view.show_stats(@hangman.remaining_lives, @hangman.wrong_letters_guessed)
      @view.display_hidden_word(@hangman.word_to_display, @hangman.correct_letters_guessed, @hangman.wrong_letters_guessed)
      @view.ask_for_input
      input = @user_input.get_input

      if @hangman.input_valid?(input)
        if @hangman.take_turn(input) == true
          @view.correct_letter_guessed(input)
        else 
          @view.wrong_letter_guessed(input)
        end
      else 
        if @hangman.duplicate?(input)
          @view.duplicate_letter_message
        else
          @view.invalid_input_message(input)
        end
      end 

    end

    if @hangman.game_won?
      @view.game_won_message(@hangman.word)
    else
      @view.game_lost_message(@hangman.word)
    end

  end

end

c = Controller.new
c.play
