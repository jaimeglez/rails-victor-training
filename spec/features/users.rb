require 'spec_helper'
require 'pry'

feature "the signin process" do
   before :all do
    @admin = FactoryGirl.create(:admin)
    FactoryGirl.create(:user)
   end
  before :each do
    visit new_admin_session_path
    fill_in 'admin[email]', with: @admin.email
    fill_in 'admin[password]', with: @admin.password 
    click_button 'Sign in'
  end

  scenario 'fill user information and save it succesfully', js: true do
    visit new_admin_user_path
    fill_in 'user[username]', with: 'nuevoUsername'
    fill_in 'user[email]', with: 'user@example.com'
    fill_in 'user[email_confirmation]', with: 'user@example.com'
    fill_in 'user[password]', with: '1234567890'
    click_button 'Save user'
    expect(page).to have_content 'nuevoUsername'
  end

  scenario 'fill user information with wrong data and saved with no success', js: true do
    visit new_admin_user_path
    fill_in 'user[username]', with: 'nuevo'
    fill_in 'user[email]', with: 'user2@example.com'
    fill_in 'user[email_confirmation]', with: 'user2@example.com'
    fill_in 'user[password]', with: '1234567890'
    click_button 'Save user'
    expect(page).to have_selector(:css, "#error_explanation li")
  end

  scenario 'Edit user information and save it succesfully', js: true do
      visit admin_users_path
      
      find('.btn-warning', match: :first).click
      expect(page).to have_content 'Editing User'
      fill_in 'user[username]', with: 'nuevoEdit'
      fill_in 'user[email]', with: 'user_edit@example.com'
      fill_in 'user[email_confirmation]', with: 'user_edit@example.com'
      fill_in 'user[password]', with: '1234567890'
      click_button 'Save user'
      expect(page).to have_content 'nuevoEdit'
      expect(page).to have_content 'user_edit@example.com'
    end

  scenario 'Delete User', js: true do
    visit admin_users_path
    list = find('tbody').all('tr')
    accept_alert do
      first(:link, 'Destroy User').click
    end
    expect(page).to have_css("tr", :count => ((list.size - 1)+1) )
  end
end
