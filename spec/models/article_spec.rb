require 'spec_helper'
require 'pry'

describe Article do
  it 'is valid with a right title' do
    article = Article.new
    User.create(username: 'ssssssss', email: 'a@a.com', email_confirmation: 'a@a.com', password: '123456789')
    article.title = 'oloas'
    article.user_id = User.last.id
    expect(article.valid?).to be_true
  end

  it 'increase number of records by one' do
    User.create(username: 'ssssssss', email: 'a@a.com', email_confirmation: 'a@a.com', password: '123456789')
    article = Article.new(title: 'asdfg', user_id: User.last.id)
    expect{article.save}.to change{Article.count}.by(1)
  end

  it 'invalid when the title is jojo' do
    article = Article.new(title: 'jojo')
    expect(article.valid?).to be_false
  end

  it 'needs to belongs to an user' do
    article = Article.new(title: 'buenos')
    expect(article.valid?).to be_false
  end
end
