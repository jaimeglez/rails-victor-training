require 'spec_helper'
require 'pry'

feature "the signin process" do
  # before :each do
  #   User.make(:email => 'user@example.com', :password => 'password')
  # end

  scenario 'fill user information and save it succesfully', js: true do
    visit new_user_path
    fill_in 'user[username]', with: 'nuevoUsername'
    fill_in 'user[email]', with: 'user@example.com'
    fill_in 'user[email_confirmation]', with: 'user@example.com'
    fill_in 'user[password]', with: '1234567890'
    click_button 'Save user'
    expect(page).to have_content 'About User'
    expect(page).to have_content 'nuevoUsername'
  end

  scenario 'fill user information with wrong data and saved with no success', js: true do
    visit new_user_path
    fill_in 'user[username]', with: 'nuevo'
    fill_in 'user[email]', with: 'user@example.com'
    fill_in 'user[email_confirmation]', with: 'user@example.com'
    fill_in 'user[password]', with: '1234567890'
    click_button 'Save user'
    expect(page).to have_selector(:css, "#error_explanation li")
  end

  scenario 'Edit user information and save it succesfully', js: true do
      visit users_path
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
    visit users_path
    list = find('tbody').all('tr')
    accept_alert do
      first(:link, 'Destroy User').click
    end
    expect(find('tbody')).to have_selector('tr', (list.size - 1))
  end
end
