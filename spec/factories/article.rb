FactoryGirl.define do
  factory :article do
    title 'Blablabla'
    user  { create(:user) }
  end
end
