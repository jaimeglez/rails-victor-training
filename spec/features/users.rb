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
end
