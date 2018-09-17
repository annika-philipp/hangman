class HangmanGame
  attr_reader :word_to_guess, :word_to_display

  def initialize(word)
    @word_to_guess = word
    @word_to_display = word.chars
  end

  def play_game
    @correct_letters_guessed = []
    @wrong_letters_guessed = []

    loop do
      mask_letters
      user_input
    end
  end

  def user_input
    puts "gimme a letter"
    puts "You've already guessed these letters #@wrong_letters_guessed"

    answer = gets.chomp.downcase
    letter_in_answer(answer)
    

  end

  def letter_in_answer(answer)
    # refactor this later
    if @wrong_letters_guessed.include? answer
      puts "You've already guessed this letter, try again"
    elsif @correct_letters_guessed.include? answer
      puts "You've already guessed this letter, try again"
    elsif word_to_guess.include? answer
      puts "This letter is in the word"
      @correct_letters_guessed.push(answer)
    else
      puts "This letter is not in the word"
      @wrong_letters_guessed.push(answer)
    end
  end

  def mask_letters
    hidden_word = word_to_display.map do |letter|
        "_" 
    end
    puts hidden_word.join(" ")
  end

  puts "Hello, time to play hangman"

end

# hardcoding word for now
h = HangmanGame.new("pizza")
h.play_game