class Answer < ApplicationRecord
  belongs_to :question

  def self.create_answer(body:, question:, correct:)
    create!(body: body, question: question, correct: correct)
  end
end
