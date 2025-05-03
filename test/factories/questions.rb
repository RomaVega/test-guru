FactoryBot.define do
  factory :question do
    sequence(:body) { |n| "What is Ruby? #{n}" }
    test
    after(:create) do |question|
      correct_answer = create(:answer, question: question, correct: true)
      question.update!(correct_answer_id: correct_answer.id)
    end
  end
end
