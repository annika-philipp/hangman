class View

  def welcome
    puts "Let's play hangman"
  end

  def ask_for_input
    puts "Give me a letter"
  end

  def invalid_input_message(input)
    puts "#{input} is not a valid input."
  end

  def lives_remaining_message(lives)
    puts "You have #{lives} lives remaining"
  end

  def incorrect_letters(wrong_letters_guessed)
    puts "Wrong letters already guessed: #{wrong_letters_guessed}"
  end
end
