FactoryBot.define do
  factory :test do
    title { "Ruby Basics" }
    level { 1 }
    category
    author { create(:user) }
  end
end
