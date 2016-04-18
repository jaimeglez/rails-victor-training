FactoryGirl.define do
  factory :article do
    title 'test article'
    text  'This is a test'
    admin  { create(:admin_user) }
  end
end
