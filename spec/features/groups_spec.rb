require 'rails_helper'

RSpec.describe 'When I open Groups index page', type: :feature do
  before(:each) do
    User.delete_all
    @user = User.create(name: 'dan', email: 'dan@example.com', password: 'password')
    sleep(1)

    visit new_user_session_path
    fill_in 'Email', with: 'dan@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'

    @group1 = Group.create(user: @user, name: 'Office', icon: 'default.png')
    @purchase1 = Purchase.create(name: 'Paper', amount: 10.0, author: @user, groups: [@group1])
    sleep(1)

    visit(groups_path)
  end

  it 'shows the correct heading' do
    expect(page).to have_content('Categories')
  end

  it 'shows the names of the group' do
    expect(page).to have_content('Office')
  end

  it 'shows the icons of the group' do
    expect(page).to have_css('img.icon')
  end

  it 'shows the total amount of the group' do
    expect(page).to have_content('$10.0')
  end

  it 'shows the Add Category button' do
    expect(page).to have_link('Add a Category', href: new_group_path)
  end

  context 'When I click on a Group name' do
    it "redirects me to that Group's transactions page" do
      click_link('Office')
      expect(page).to have_current_path(group_purchases_path(@group1))
    end
  end

  context 'When I click on a Add Group button' do
    it 'redirects me to form that adds new Group' do
      click_link('Add a Category')
      expect(page).to have_current_path(new_group_path)
    end
  end
end
