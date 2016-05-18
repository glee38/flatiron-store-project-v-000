FactoryGirl.define do
  factory :user do
    #sequence(:name) { |n| "TestUser#{n}" }
    email "test@example.com"
    password "please123"
  end
end
