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
      @hangman.hide_word
      @view.ask_for_input
      input = @user_input.get_input
      if @hangman.input_valid?(input)
        @hangman.take_turn(input)
      else 
        @view.invalid_input_message(input)
      end 
    end
    puts "great game"
  end
end

c = Controller.new
c.play



        # below is Jah's input - figure this out!
        # @view.print_turn_result(@hangman)

    #     turn_result = @hangman.take_turn(input)
    #     @view.print_turn_result(turn_result)
