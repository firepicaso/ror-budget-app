require 'rails_helper'

RSpec.describe 'When I open webpage for the first time', type: :feature do
  before(:each) do
    visit unauthenticated_root_path
  end

  context 'shows the correct' do
    it 'heading' do
      expect(page).to have_content('BudgetLover')
    end

    it 'links' do
      expect(page).to have_link('LOG IN', href: new_user_session_path)
      expect(page).to have_link('SIGN UP', href: new_user_registration_path)
    end
  end

  context 'When I click on links' do
    it 'redirects me to sign in pages' do
      click_on('LOG IN')
      expect(page).to have_current_path(new_user_session_path)
    end

    it 'redirects me to sign up page' do
      click_on('SIGN UP')
      expect(page).to have_current_path(new_user_registration_path)
    end
  end

  context 'When I sign in with valid attributes' do
    before(:each) do
      @user = User.create(name: 'dan', email: 'dan@example.com', password: 'password')
      visit new_user_session_path

      fill_in 'Email', with: 'dan@example.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
    end

    it 'redirects me to Groups page' do
      expect(page).to have_current_path(authenticated_root_path)
    end

    it 'redirects me to sign up page' do
      expect(page).to have_content('Categories')
    end
  end
end
