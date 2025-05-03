FactoryBot.define do
  factory :answer do
    sequence(:body) { |n| "Answer #{n}" }
    correct { false }
    question
  end
end
