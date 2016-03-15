require 'spec_helper'
require 'pry'

describe User do
  before(:each) do
    @user = User.new
    @user.username = 'hdhddkddkkdjdj'
    @user.email = 'a@a.com'
    @user.email_confirmation = 'a@a.com'
    @user.password = '111111111111'
  end

  it 'is invalid when there is not username' do
    user = User.new
    user.valid?
    expect(user.errors.messages[:username]).to include("can't be blank")
    expect(user.errors.messages[:email]).to include("can't be blank")
    expect(user.errors.messages[:email_confirmation]).to include("can't be blank")
    expect(user.errors.messages[:password]).to include("can't be blank")
  end

  it 'is valid username only letters' do
    @user.valid?
    expect(@user.errors.messages[:username]).to be_nil
    expect(@user.save).to be_true
  end

  it 'is invalid username when length < 8' do
    @user.username = 'hugoooo'
    @user.valid?
    expect(@user.errors.messages[:username]).to include('is too short (minimum is 8 characters)')
  end

  it 'is valid when its a real email' do
    expect(@user.email).to match(/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i)
    expect(@user.valid?).to be_true
  end

  it 'is invalid when there is not email_comfirmation' do
    @user.email_confirmation = ''
    expect(@user.valid?).to be_false
  end
  # ===========================================================

  it 'match email with email_confirmation' do
    @user = User.new
    @user.email_confirmation = 'a@a.com'
    @user.email = 'a@a.com'
    expect(@user.email).to match(@user.email_confirmation)
  end

  it 'is invalid when password has letters' do
    @user.password = '11111kk11n1'
    expect(@user.save).to be_false
  end

  it 'is valid username length >= 8' do
    @user = User.new
    @user.password = '1232323445'
    expect(@user.password.length).to be >= 8
  end

  it 'increase number of records by one in user' do
    @user = User.new(username: 'ssssssss', email: 'a@a.com', email_confirmation: 'a@a.com', password: '123456789')
    expect{@user.save}.to change{User.count}.by(1)
  end

end
