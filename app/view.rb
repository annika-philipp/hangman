class View

  def welcome
    puts "Let's play hangman"
  end

  def show_stats(remaining_lives, wrong_letters_guessed)
    lives_remaining_message(remaining_lives)
    incorrect_letters_message(wrong_letters_guessed)
  end

  def lives_remaining_message(remaining_lives)
    puts "You have #{remaining_lives} lives remaining"
  end

  def incorrect_letters_message(wrong_letters_guessed)
    puts "Wrong letters already guessed: #{wrong_letters_guessed}"
  end

  def mask_letters(word_to_display, correct_letters_guessed, wrong_letters_guessed)
    @hidden_word = word_to_display.map do |letter|
      correct_letters_guessed.include?(letter) ? letter : "_"
    end
    puts @hidden_word.join(" ")
    puts @wrong_letters_guessed
  end

  def ask_for_input
    puts "Give me a letter"
  end

  def invalid_input_message(input)
    puts "#{input} is not a valid input."
  end

  def correct_letter_guessed(answer)
    puts "Yuss, #{answer} is in the word."
  end

  def wrong_letter_guessed(answer)
    puts "Nope, #{answer} is not in the word."
  end

  def duplicate_letter_message
    puts "You've already guessed this letter, try again"
  end

  def game_lost_message(word)
    puts "You lost, the word was: #{word}."
  end

  def game_won_message(word)
    puts "Look at you, what a winner, you guessed the right word: #{word}!"
  end
end
