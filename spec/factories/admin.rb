FactoryGirl.define do
	sequence :email do |n|
    "user#{n}@example.com"
  end
  sequence :email_confirmation do |n|
    "user#{n}@example.com"
  end
  factory :admin do
    email
    email_confirmation
    password '12345678'
    username 'VictorHugo'
    factory :admin_user do
      role 'admin'
    end

    factory :simple_user do
      role 'user'
    end
  end
end