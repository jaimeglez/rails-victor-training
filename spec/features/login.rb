require 'spec_helper'
require 'pry'

feature "the signin process" do
   before :all do
    @admin = FactoryGirl.create(:admin_user)
    @user=FactoryGirl.create(:simple_user)
   end
  

  scenario 'login as admin succesfully', js: true do
    visit new_admin_session_path
    fill_in 'admin[email]', with: @admin.email
    fill_in 'admin[password]', with: @admin.password 
    click_button 'Sign in'
    visit admin_admins_path
    expect(page).to have_content 'Signed in successfully'
  end

  scenario 'login as user succesfully', js: true do
    visit new_admin_session_path
    fill_in 'admin[email]', with: @user.email
    fill_in 'admin[password]', with: @user.password 
    click_button 'Sign in'
    visit admin_admin_articles_path(@user)
    expect(page).to have_content 'Signed in successfully'
  end
end
