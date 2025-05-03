FactoryBot.define do
  factory :question do
    body { "What is Ruby?" }
    test
    after(:create) do |question|
      correct_answer = create(:answer, question: question, correct: true)
      question.update!(correct_answer_id: correct_answer.id)
    end
  end
end
