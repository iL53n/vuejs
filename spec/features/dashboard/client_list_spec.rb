require 'rails_helper'

feature 'Staff can see all users', %q{
  In order to find the right customer
  As a staff
  I'd like to be able to see all users
} do

  given(:staff) { create(:staff) }
  given!(:clients) { create_list(:client, 5) }

  describe 'Current user == staff', js: true do
    background do
      visit new_staff_session_path
      sign_in(staff)
      visit staff_welcome_index_path
    end

    scenario 'show all users' do
      clients.each do |client|
        within 'table' do
          expect(page).to have_content client.email
        end
      end
    end
  end
end