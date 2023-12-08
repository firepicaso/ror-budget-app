require 'rails_helper'

RSpec.describe Purchase, type: :model do
  let(:valid_attributes) { { 'author' => @user, 'name' => 'Electric Kettle', 'amount' => 1 } }
  let(:no_name) { { 'author' => @user, 'amount' => 1 } }
  let(:no_author) { { 'name' => 'Electric Kettle', 'amount' => 1 } }
  let(:no_amount) { { 'author' => @user, 'name' => 'Electric Kettle' } }
  let(:amount_float) do
    { 'author' => @user, 'name' => 'Electric Kettle', 'amount' => 20.0 }
  end

  before :all do
    User.delete_all
    @user = User.create(name: 'dan', email: 'dan@example.com', password: 'password')
  end

  context 'user' do
    it 'is valid when attribute exists' do
      expect(Purchase.create(valid_attributes)).to be_valid
    end

    it 'is not valid when attribute is blank' do
      expect(Purchase.create(no_author)).to_not be_valid
    end
  end

  context 'name' do
    it 'is valid when attribute exists' do
      expect(Purchase.create(valid_attributes)).to be_valid
    end

    it 'is not valid when attribute is blank' do
      expect(Purchase.create(no_name)).to_not be_valid
    end
  end

  context 'amount' do
    it 'is not valid when attribute is blank' do
      expect(Purchase.create(no_amount)).to_not be_valid
    end

    it 'is valid when attribute is float' do
      expect(Purchase.create(amount_float)).to be_valid
    end
  end
end
