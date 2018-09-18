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
    @game_over = false

    loop do
      mask_letters
      user_input
      check_game_over
      play_again
    end
  end

  def user_input
    puts "\nYou have #@lives lives left"
    puts "Gimme a letter"
    puts "You've already guessed these letters #@wrong_letters_guessed"

    answer = gets.chomp.downcase[0,1]
    letter_in_answer(answer)
  end

  def letter_in_answer(answer)
    # refactor this later
    if answer.match(/\p{L}\p{M}*+/)
      if @wrong_letters_guessed.include? answer
        puts "You've already guessed this letter, try again"
      elsif @correct_letters_guessed.include? answer
        puts "You've already guessed this letter, try again"
      elsif word_to_guess.include? answer
        puts "This letter is in the word"
        @correct_letters_guessed.push(answer)
        @correct_letters_guessed.push(answer.upcase)
      else
        puts "This letter is not in the word"
        @wrong_letters_guessed.push(answer)
        reduce_life
      end
    else
      puts "Please enter a valid letter"
    end
  end

  def reduce_life
    @lives -= 1
  end

  def mask_letters
    @hidden_word = word_to_display.map do |letter|
      if @correct_letters_guessed.include? letter
        letter
      else
        "_"
      end 
    end
    puts @hidden_word.join(" ")
  end

  def check_game_over
    check_win || check_loss
  end

  def check_loss
    if @lives == 0
      puts "You lost, the word was: #{word}."
      @game_over = true
    #   exit
    end
  end

  def check_win
    if word_to_display - @correct_letters_guessed == []
      puts "Look at you, what a winner, you guessed the right word: #{word}!"
      @game_over = true
    #   exit 
    end
  end

  def play_again
    if @game_over
      puts "Play again? Y/N"
      new_game = gets.chomp.upcase
      if new_game == "N"
        puts "Good Bye"
        exit
      elsif new_game == "Y"
        puts "Ummmm tough look you can only play once!"
      else
        puts "please enter Y or N"
        play_again
      end
      exit
    end
  end

  puts "Hello, time to play hangman"

end

# hardcoding word for now
h = HangmanGame.new("Pizza")
h.play_game