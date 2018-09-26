require_relative '../app/view'

describe View do
  it 'should display welcome message' do
    v = View.new
    message = v.welcome
    expect(message).to eq nil
  end
end
