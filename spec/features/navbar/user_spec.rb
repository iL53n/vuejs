require 'rails_helper'

feature 'User can show his email and can sign out', %q{
  In order to finish session
  As a auhorized user
  I'd like to be able to see my email and sign out
} do

  describe 'Current user == client', js: true do
    given(:client) { create(:client) }

    background do
      visit new_client_session_path
      sign_in(client)
      visit client_welcome_index_path
    end

    scenario 'show email' do
      expect(page).to have_content client.email
    end

    scenario 'can sign out' do
      expect(page).to have_link 'SignOut'
      click_on 'SignOut'

      expect(page).to have_content 'Signed out successfully.'
      expect(current_path).to eq root_path

      expect(page).to_not have_content client.email
      expect(page).to_not have_button 'SignOut'
    end
  end

  describe 'Current user == staff', js: true do
    given(:staff) { create(:staff) }

    background do
      visit new_staff_session_path
      sign_in(staff)
      visit staff_welcome_index_path
    end

    scenario 'show email' do
      expect(page).to have_content staff.email
    end

    scenario 'can sign out' do
      expect(page).to have_link 'SignOut'
      click_on 'SignOut'

      expect(page).to have_content 'Signed out successfully.'
      expect(current_path).to eq root_path

      expect(page).to_not have_content staff.email
      expect(page).to_not have_button 'SignOut'
    end
  end
end