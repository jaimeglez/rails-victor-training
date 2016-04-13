require 'spec_helper'
require 'pry'

feature "the signin process" do
   before :all do
    @admin = FactoryGirl.create(:admin)
   end
  

  scenario 'login as admin succesfully', js: true do
    visit new_admin_session_path
    fill_in 'admin[email]', with: @admin.email
    fill_in 'admin[password]', with: @admin.password 
    click_button 'Sign in'
    visit admin_users_path
    expect(page).to have_content 'Signed in successfully'
  end
end