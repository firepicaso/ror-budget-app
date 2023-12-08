require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:valid_attributes) { { 'user' => @user, 'name' => 'Office', 'icon' => 'default.png' } }
  let(:no_name) { { 'user' => @user, 'icon' => 'default.png' } }
  let(:no_icon) { { 'user' => @user, 'name' => 'Office' } }

  before :all do
    @user = User.create(name: 'dan', email: 'dan@example.com', password: 'password')
  end

  context 'user' do
    it 'is valid when attribute exists' do
      expect(Group.create(valid_attributes)).to be_valid
    end
  end

  context 'name' do
    it 'is valid when attribute exists' do
      expect(Group.create(valid_attributes)).to be_valid
    end

    it 'is not valid when attribute is blank' do
      expect(Group.create(no_name)).to_not be_valid
    end
  end

  context 'icon' do
    it 'is valid when attribute exists' do
      expect(Group.create(valid_attributes)).to be_valid
    end

    it 'is not valid when attribute is blank' do
      expect(Group.create(no_icon)).to_not be_valid
    end
  end
end
