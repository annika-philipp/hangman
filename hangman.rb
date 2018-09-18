class HangmanGame
  attr_reader :word, :word_to_guess, :word_to_display

  def initialize(word)
    @word               = word
    @word_to_guess      = word.downcase
    @word_to_display    = word.chars
  end

  def play_game
    @correct_letters_guessed = []
    @wrong_letters_guessed = []
    @lives = 8

    puts "Hello, time to play hangman"

    while !game_over? do
      mask_letters
      letter_in_answer(user_input)
    end

  end

  def user_input
    puts "\nYou have #@lives lives left"
    puts "Gimme a letter"
    puts "You've already guessed these letters #@wrong_letters_guessed"

    gets.chomp.downcase[0,1]
  end

  def valid_answer?(answer)
    answer.match(/\p{L}\p{M}*+/)
  end

  def duplicate_letter(answer)
    if @wrong_letters_guessed.include?(answer) || @correct_letters_guessed.include?(answer)
      puts "You've already guessed this letter, try again"
      true
    end
  end

  def new_letter(answer)
    if word_to_guess.include? answer
      puts "This letter is in the word"
      @correct_letters_guessed.push(answer)
      @correct_letters_guessed.push(answer.upcase)
    else
      puts "This letter is not in the word"
      @wrong_letters_guessed.push(answer)
      reduce_life
    end
  end

  def letter_in_answer(answer)
    if valid_answer?(answer)
      new_letter(answer) unless duplicate_letter(answer)
    else
      puts "Please enter a valid letter"
    end
  end

  def reduce_life
    @lives -= 1
  end

  def mask_letters
    @hidden_word = word_to_display.map do |letter| 
      @correct_letters_guessed.include?(letter) ? letter : "_" 
    end
    puts @hidden_word.join(" ")
  end

  def game_over?
    check_win? || check_loss?
  end

  def check_loss?
    if @lives == 0
      puts "You lost, the word was: #{word}."
      true
    end
  end

  def check_win?
    if word_to_display - @correct_letters_guessed == []
      puts "Look at you, what a winner, you guessed the right word: #{word}!"
      true
    end
  end

end

h = HangmanGame.new("PizZa")
h.play_game
