require 'spec_helper'
require 'pry'

describe Article do

  let(:article){ build :article }

  it 'is valid with a right title' do
    article.title = 'oloas'
    expect(article.valid?).to be_true
  end

  it 'increase number of records by one' do
    expect{article.save}.to change{Article.count}.by(1)
  end

  it 'invalid when the title is jojo' do
    article.title = 'jojo'
    expect(article.valid?).to be_false
  end

  it 'needs to belongs to an user' do
    article = Article.new
    expect(article.valid?).to be_false
  end
end
