FactoryGirl.define do
  factory :user do
    username 'VictorHugo'
    email 'hugo@gmail.com'
    email_confirmation 'hugo@gamil.com'
    password '12345678'
    role 'user'
  end
end
