require 'spec_helper'
require 'pry'

describe User do

  it 'is valid username only letters' do
    user = User.new
    user.username = 'hdhddkddkkdjdj'
    expect(/\A[a-zA-Z]+\z/).to match(user.username) 
  end

  it 'is valid username length >= 8' do
    user = User.new
    user.username = 'hugoooo'
    expect(user.username.length).to be >= 8
  end

  it 'is valid email' do
    user = User.new
    user.email = 'a@a.com'
    expect(/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i).to match(user.email) 
  end

  it 'is valid email comfirmation' do
    user = User.new
    user.email_confirmation = 'a@a.com'
    expect(/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i).to match(user.email_confirmation) 
  end

  it 'match email with email_confirmation' do
    user = User.new
    user.email_confirmation = 'a@a.com'
    user.email = 'a@a.com'
    expect(user.email).to match(user.email_confirmation)
  end

  it 'is valid password only numbers' do
    user = User.new
    user.password = '11111kk11n1'
    expect(/^[0-9]+$/).to match(user.password)
  end
  
  it 'is valid username length >= 8' do
    user = User.new
    user.password = '1232323445'
    expect(user.password.length).to be >= 8
  end

  it 'increase number of records by one in user' do
    user = User.new(username: 'ssssssss', email: 'a@a.com', email_confirmation: 'a@a.com', password: '123456789')
    expect{user.save}.to change{User.count}.by(1)
  end

end