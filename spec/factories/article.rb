FactoryGirl.define do
  factory :article do
    title 'test article'
    text  'This is a test'
    user  { create(:user) }
  end
end
