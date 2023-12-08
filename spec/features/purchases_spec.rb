require 'rails_helper'

RSpec.describe 'When I open Purchases index page', type: :feature do
  before(:each) do
    @user = User.create(name: 'dan', email: 'dan@example.com', password: 'password')
    sleep(1)

    visit new_user_session_path
    fill_in 'Email', with: 'dan@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'

    @group1 = Group.create(user: @user, name: 'Office', icon: 'https://i.pravatar.cc/300?img=13')
    @purchase1 = Purchase.create(name: 'Paper', amount: 6.0, author: @user, groups: [@group1])
    @purchase2 = Purchase.create(name: 'Light', amount: 4.0, author: @user, groups: [@group1])
    visit(group_purchases_path(@group1))
  end

  it 'shows the correct heading' do
    expect(page).to have_content('Transactions')
  end

  it 'shows the name of each purchase' do
    expect(page).to have_content('Paper')
  end

  it 'shows the amount of the purchase' do
    expect(page).to have_content('$6.0')
  end

  it 'shows the total amount for the Group' do
    expect(page).to have_content('$10.0')
  end

  it 'shows the Add Transaction button' do
    expect(page).to have_link('Add a Transaction', href: new_group_purchase_path(@group1))
  end

  context 'When I click on a Group name' do
    it "redirects me to that Group's transactions page" do
      click_link('Paper')
      expect(page).to have_current_path(group_purchase_path(@group1, @purchase1))
    end
  end

  context 'When I click on a Add Transaction button' do
    it 'redirects me to form that adds new Transaction' do
      click_link('Add a Transaction')
      expect(page).to have_current_path(new_group_purchase_path(@group1))
    end
  end
end
