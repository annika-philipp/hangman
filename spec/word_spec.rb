require_relative '../app/word'

describe Word do

  # = subject creates an instance of Word once straight after describe and this instance instance will be available for all tests

  # initialise exactly the same way as in code
  subject(:word) { Word.new(:secret_word => "pizza") }

  # - 'lazy evaluation' - lets gets created only when it's referred to
  # let(:secret_word) {"hello"}

  # # indicates that it's not a self. method
  context '#input_valid_letter?' do
    it "should return true for 'a' " do
      test_input = "a"
      expect(word.input_valid_letter? test_input).to be true
    end

    it "should return true for 'A' " do
      test_input = "A"
      expect(word.input_valid_letter? test_input).to be true
    end

    it "should return false for '4' " do
      test_input = "4"
      expect(word.input_valid_letter? test_input).to be false
    end

    it "should return false for ':' " do
      test_input = ":"
      expect(word.input_valid_letter? test_input).to be false
    end
  end



end
