class Hangman
  # attr_reader :word, :lives

    #how does this work? is this how you access values from hashes?
  def initialize(hsh = {})
    @word = hsh[:word]
    @lives = hsh[:lives]
  end

  def running?
    true
  end

  def input_valid?(input)
    if input.match(/[a-zA-Z]/).nil? 
      return false
    else
      return true
    end

    # returns an array, which is true
  end

  def take_turn(input)
  end

  # this is just for checking how RSpec works, works when I uncomment initialize
  # def has_vowels?(str)
  #   !!(str =~ /[aeiou]+/i)
  # end


end

# allows for all kindsa unicode, å, ß, ø etc.
# if input.match(/\p{L}\p{M}*+/).nil? 

