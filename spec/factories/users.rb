FactoryGirl.define do
  factory :user do
    confirmed_at Time.now
    #sequence(:name) { |n| "TestUser#{n}" }
    email "test@example.com"
    password "please123"
  end
end
