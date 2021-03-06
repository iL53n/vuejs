require 'rails_helper'

feature 'Staff can create new client', %q{
  In order to managment client base
  As a staff
  I'd like to be able to create a new client
} do

  given(:staff) { create(:staff) }
  given!(:client) { create(:client) }

  describe 'Current user == staff', js: true do
    background do
      visit new_staff_session_path
      sign_in(staff)
      visit staff_welcome_index_path
    end

    scenario 'create a new client with valid attr' do
      fill_in 'Full name', with: 'Sergey Sergeev'
      fill_in 'Phone', with: '1234567890'
      fill_in 'Email', with: 'newclient@test.com'
      click_on 'Create new client'

      expect(current_path).to eq staff_welcome_index_path

      within 'table' do
        expect(page).to have_content 'Sergey Sergeev'
        expect(page).to have_content '1234567890'
        expect(page).to have_content 'newclient@test.com'
      end
    end

    context 'try create a new client with' do
      scenario 'invalid attr' do
        ['Full name', 'Phone', 'Email'].each do |field|
          fill_in field, with: 'xxx'
          expect(page).to have_button 'Create new client', disabled: true
        end
      end

      scenario 'already registered email' do
        fill_in 'Full name', with: 'Valid name'
        fill_in 'Phone', with: '1234567890'
        fill_in 'Email', with: client.email
        click_on 'Create new client'

        expect(page).to have_content 'has already been taken'
        expect(page).to have_button 'Create new client', disabled: true

        fill_in 'Email', with: 'newtest@test.com'
        expect(page).to_not have_content 'has already been taken'
        click_on 'Create new client'

        within 'table' do
          expect(page).to have_content 'newtest@test.com'
        end
      end
    end
  end
end