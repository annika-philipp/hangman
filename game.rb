require_relative 'hangman_game'
require_relative 'word_to_guess'
require_relative 'user_input'

class Game
  attr_reader :hangman, :w, :word  
  # initialize
  def initialize
    # hangman game
    @hangman = Hangman.new

    # initialize WordToGuess class - but should the others really live here or in WordToGuess?
    @w = WordToGuess.new("PizZa")

    # initialize user input
    @user_input = UserInput.new

    # lives live here
    @lives = 8
  end

  def play
    puts "Hello, time to play hangman"
    w.hello

    # this should be part of the loop
    puts "You have #@lives lives left"
  end
end

g = Game.new
g.play
# h = Hangman.new
# h.hello_hm
# w = WordToGuess.new
# w.hello
# u = UserInput.new
# u.hello