# gives a funky MatchData error
# also do I create a fake new Hangman object with word and lives?

# hangman gets created by controller class, so dummy controller (to test hangman in isolation?)
require_relative '../app/hangman_game'

describe Hangman do
  it 'should check if input is valid' do
    hm = Hangman.new
    test_input = "a"
    expect(hm.input_valid? test_input).to be true
  end 
end


# this is for checking how RSpec works
# describe Hangman do
#   it 'shoudl return true for a vowel' do
#     hm = Hangman.new
#     test_input = 'a'
#     expect(hm.has_vowels? test_input).to be true
#   end
# end


