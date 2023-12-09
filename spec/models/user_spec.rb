require 'rails_helper'

RSpec.describe User, type: :model do
  context 'attribute name' do
    it 'is not valid with blank name' do
      expect(User.new(name: nil, email: 'dan@example.com', password: 'password')).to_not be_valid
    end
  end
end
