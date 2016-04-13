require 'spec_helper'
require 'pry'

feature "the signin process" do
  before :all do
    @admin = FactoryGirl.create(:admin)
    FactoryGirl.create(:article)
   end
  before :each do
    visit new_admin_session_path
    fill_in 'admin[email]', with: @admin.email
    fill_in 'admin[password]', with: @admin.password 
    click_button 'Sign in'
  end

  scenario 'fill article information and save it succesfully', js: true do
    visit admin_users_path
    all('i.fa.fa-plus')[1].click
    expect(page).to have_content 'New articles'
    fill_in 'article[title]', with: 'test 3'
    fill_in 'article[text]', with: 'Description test 3'
    attach_file 'article[img]', File.join(Rails.root, 'spec/features', 'images', 'article.jpg')
    click_button 'Save article'
    expect(page).to have_content 'test 3'
    expect(page).to have_content 'Description test 3'
  end

  scenario 'Edit article information and save it succesfully', js: true do
    visit admin_users_path
    all('i.fa.fa-eye')[1].click #Click on Show articles
    find('.btn-warning', match: :first).click
    expect(page).to have_content 'Editing article'
    fill_in 'article[title]', with: 'test edit'
    fill_in 'article[text]', with: 'Description test edit'
    attach_file 'article[img]', File.join(Rails.root, 'spec/features', 'images', 'article.jpg')
    click_button 'Save article'

    expect(page).to have_content 'test edit'
    expect(page).to have_content 'Description test edit'
  end

  scenario 'Delete article', js: true do
    visit admin_users_path
    all('i.fa.fa-eye')[1].click #Select the first button Destroy article
    list = find('tbody').all('tr')
    accept_alert do
      first(:link, 'Destroy Article').click
    end
    expect(page).to have_css("tr", :count => ((list.size - 1)+1) )
  end

end