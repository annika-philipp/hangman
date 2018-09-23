require_relative 'hangman_game'
require_relative 'word_to_guess'
require_relative 'user_input'
require_relative 'view'

class Controller
  def initialize
    # I'm passing a hash to Hangman, right? How does the syntax in the actual class work?
    @hangman    = Hangman.new(word: "Pizza", lives: 8)
    # puts @hangman.word
    # puts @hangman.lives
    # puts @hangman.word_to_guess
    # puts @hangman.word_to_display
    @user_input = UserInput.new
    @view       = View.new

    # # initialize WordToGuess class - but should the others really live here or in WordToGuess?
    # @w = WordToGuess.new("PizZa")
  end

  def play
    @view.welcome
    # loop until hangman.running? evaluates to false
    while @hangman.running?

      @view.ask_for_input
      input = @user_input.get_input
      if @hangman.input_valid?(input)
        @hangman.letter_in_word(input)
        # # if @hangman.input_duplicate?(input)
        #   # @view.duplicate_input_message(input)
        # else
        puts "yuss"
    #     turn_result = @hangman.take_turn(input)
          
    #     @view.print_turn_result(turn_result)
      else 
        @view.invalid_input_message(input)
      end 
    end
  end
end

c = Controller.new
c.play

# methods - verbose : what is the result of it
