require 'spec_helper'

feature "the signin process" do
  # before :each do
  #   User.make(:email => 'user@example.com', :password => 'password')
  # end

  scenario 'fill document information and save it succesfully', js: true do
    visit users_path
    fill_in 'email', :with => 'user@example.com'
    # click_button 'Sign in'
    # expect(page).to have_content 'Success'
  end
end
