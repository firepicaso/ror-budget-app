require 'rails_helper'

RSpec.describe User, type: :model do
  context 'attribute name' do
    it 'is valid with existing name' do
      expect(User.new(name: 'dan', email: 'dan@example.com', password: 'password')).to be_valid
    end

    it 'is not valid with blank name' do
      expect(User.new(name: nil, email: 'dan@example.com', password: 'password')).to_not be_valid
    end
  end
end