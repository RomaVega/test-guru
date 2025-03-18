class Question < ApplicationRecord
  has_many :answers, dependent: :destroy

  validates :body, presence: true, uniqueness: true
  validates :test_id, numericality: { only_integer: true }, presence: true
  validate :answers_count_within_limit
  validate :must_have_one_correct_answer

  private

  def answers_count_within_limit
    if answers.size < 1 || answers.size > 4
    errors.add(:answers, "Must have between 1 and 4 answers")
    end
  end

  def must_have_one_correct_answer
    if answers.where(correct: true).count < 1
      errors.add(:answers, "Must be 1 correct answer and 3 incorrect")
    end
  end
end
