require 'spec_helper'
require 'pry'

describe User do

  let(:user){ build :user }

  it 'is invalid when there is not username' do
    user = User.new
    user.valid?
    expect(user.errors.messages[:username]).to include("can't be blank")
    expect(user.errors.messages[:email]).to include("can't be blank")
    expect(user.errors.messages[:email_confirmation]).to include("can't be blank")
    expect(user.errors.messages[:password]).to include("can't be blank")
  end

  it 'is valid username only letters' do
    user.valid?
    expect(user.errors.messages[:username]).to be_nil
    expect(user.save).to be_true
  end

  it 'is invalid username when length < 8' do
    user.username = 'hugoooo'
    user.valid?
    expect(user.errors.messages[:username]).to include('is too short (minimum is 8 characters)')
  end

  it 'is valid when its a real email' do
    expect(user.email).to match(/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i)
    expect(user.valid?).to be_true
  end

  it 'is invalid when there is not email_comfirmation' do
    user.email_confirmation = ''
    expect(user.valid?).to be_false
  end

  it 'invalid match email with email_confirmation' do
    user.email_confirmation = 'a1@a.com'
    user.valid?
    expect(user.errors.messages[:email_confirmation]).to include("doesn't match Email")

  end

  it 'is valid when password has letters' do
    user.valid?
    expect(user.errors.messages[:password]).to be_nil
    expect(user.save).to be_true
  end

  it 'is invalid password length < 8' do
    user.password = '1111111'
    user.valid?
    expect(user.errors.messages[:password]).to include('is too short (minimum is 8 characters)')
  end

  it 'is valid increase number of records by one in user' do
    expect{user.save}.to change{User.count}.by(1)
  end

end
