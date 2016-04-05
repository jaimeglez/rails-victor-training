require 'spec_helper'
require 'pry'

feature "the signin process" do
  # before :each do
  #   User.make(:email => 'user@example.com', :password => 'password')
  # end

  scenario 'fill article information and save it succesfully', js: true do
    visit users_path
    all('i.fa.fa-plus')[1].click
    expect(page).to have_content 'New articles'
    fill_in 'article[title]', with: 'test 3'
    fill_in 'article[text]', with: 'Description test 3'
    click_button 'Save article'
    expect(page).to have_content 'test 3'
    expect(page).to have_content 'Description test 3'
  end

  scenario 'Edit article information and save it succesfully', js: true do
    visit users_path
    all('i.fa.fa-eye')[1].click #Click on Show articles
    find('.btn-warning', match: :first).click
    expect(page).to have_content 'Editing article'
    fill_in 'article[title]', with: 'test edit'
    fill_in 'article[text]', with: 'Description test edit'
    click_button 'Save article'
    expect(page).to have_content 'test edit'
    expect(page).to have_content 'Description test edit'
  end

  scenario 'Delete article', js: true do
    visit users_path
    all('i.fa.fa-eye')[1].click
    list = find('tbody').all('tr')
    accept_alert do
      first(:link, 'Destroy Article').click
    end
    expect(find('tbody')).to have_selector('tr', (list.size - 1))
  end

end