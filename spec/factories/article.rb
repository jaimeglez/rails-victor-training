FactoryGirl.define do
  factory :article do
    title 'test article'
    text  'This is a test'
    factory :article_admin do
      admin  { create(:admin_user) }
    end
    factory :article_user do
      admin  { create(:simple_user) }
    end
  end
end
