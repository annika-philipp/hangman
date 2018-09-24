class Hangman
  attr_reader :word, :word_to_guess, :word_to_display

  def initialize(hsh = {})
    @word = hsh[:word]
    @lives = hsh[:lives]
    @view = hsh[:view]
    @word_to_guess = word.downcase
    @word_to_display = word.chars
    @correct_letters_guessed = []
    @wrong_letters_guessed = []
  end

  def running?
    @view.lives_remaining_message(@lives)
    @view.incorrect_letters(@wrong_letters_guessed)
    mask_letters
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

  def take_turn(input)
    letter_in_word(input) unless duplicate_letter(input)
    game_over
  end

  def duplicate_letter(answer)
    if @wrong_letters_guessed.include?(answer) || @correct_letters_guessed.include?(answer)
      @view.duplicate_letter_message
      true
    end
  end

  def letter_in_word(answer)
    if word_to_guess.include? answer
      @correct_letters_guessed.push(answer)
      @view.correct_letter_guessed(answer)
    else
      @wrong_letters_guessed.push(answer)
      @view.wrong_letter_guessed(answer)
      reduce_life
    end
  end

  def reduce_life
    @lives -= 1
  end


  def game_over
    win || loss
  end

  def win
    if word_to_display - @correct_letters_guessed == []
      @view.game_won_message(word)
      true
    end
  end

  def loss
    if @lives == 0
      @view.game_lost_message(word)
      true
    end
  end

  # this is just for checking how RSpec works, works when I uncomment initialize
  # def has_vowels?(str)
  #   !!(str =~ /[aeiou]+/i)
  # end


end

# allows for all kindsa unicode, å, ß, ø etc.
# if input.match(/\p{L}\p{M}*+/).nil? 

