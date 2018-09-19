require_relative 'hangman_game'
require_relative 'word_to_guess'
require_relative 'user_input'
require_relative 'view'

class Controller
  def initialize
    @hangman    = Hangman.new(word: "Pizza", lives: 8)
    @user_input = UserInput.new
    @view       = View.new

    # # initialize WordToGuess class - but should the others really live here or in WordToGuess?
    # @w = WordToGuess.new("PizZa")
  end

  def play
    @view.welcome
    @hangman.hello
    # # loop until game over
    # while @hangman.running?
    #   input = @user_input.get_input
    #   if @hangman.input_valid?(input)
    #     turn_result = @hangman.take_turn(input)
          
    #     @view.print_turn_result(turn_result)
    #   else 
    #     @view.invalid_input_message(input)
    #   end 
    # end
  end
end

c = Controller.new
c.play
