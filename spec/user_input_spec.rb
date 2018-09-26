require_relative '../app/user_input'
require 'byebug'

# allow lets me mock the gets method
describe UserInput do
  it 'should take an input' do
    ui = UserInput.new
    allow(ui).to receive_messages( :get_input => 'a')
    # byebug
    ui.get_input.should == 'a'
  end
end
