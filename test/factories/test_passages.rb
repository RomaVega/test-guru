FactoryBot.define do
  factory :test_passage do
    user
    test
    current_question { create(:question, test: test) } # Явно создаём вопрос
    correct_questions { 0 }
    completed { false }
  end
end
