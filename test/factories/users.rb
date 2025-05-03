FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "Test#{n}" }
    sequence(:email) { |n| "user#{n}@example.com" }
  end
end
