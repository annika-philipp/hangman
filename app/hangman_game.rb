class Hangman
  attr_reader :word, :lives, :word_to_guess, :word_to_display

    #how does this work? is this how you access values from hashes?
  def initialize(hsh = {})
    @word = hsh[:word]
    @lives = hsh[:lives]
    @word_to_guess = word.downcase
    @word_to_display = word.chars
    @correct_letters_guessed = []
    @wrong_letters_guessed = []
  end

  def running?
    mask_letters
    #the puts should be handled by @views
    puts @correct_letters_guessed
    puts "Wrong letters already guessed: #@wrong_letters_guessed"
    # check if letter is in word (or do this separately?)
    true
  end

  def mask_letters
    @hidden_word = word_to_display.map do |letter|
      @correct_letters_guessed.include?(letter) ? letter : "_"
    end
    puts @hidden_word.join(" ")
  end

  def input_valid?(input)
    if input.match(/[a-zA-Z]/).nil? 
      return false
    else
      return true
    end
    # returns an array, for test to work had to add the if/else statement, or could have rewritten test
  end

  def letter_in_word(answer)
    if word_to_guess.include? answer
      @correct_letters_guessed.push(answer)
    else
      @wrong_letters_guessed.push(answer)
    end
  end

  # implement later
  # def input_duplicate?(input)
  # end


  # implement later
  # def take_turn(input)
  #   # gets called with valid input
  #     # check if win
  #     # check if lost
  # end

  # implement later
  # def input_duplicate?(input)
  # end


  # def win
  # end

  # def lost
  # end

  # this is just for checking how RSpec works, works when I uncomment initialize
  # def has_vowels?(str)
  #   !!(str =~ /[aeiou]+/i)
  # end


end

# allows for all kindsa unicode, å, ß, ø etc.
# if input.match(/\p{L}\p{M}*+/).nil? 

