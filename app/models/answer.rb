class Answer < ApplicationRecord
  belongs_to :question

  validate :validate_answers_count, on: :create
  validate :at_least_one_correct_answer, on: :create

  validates :body, presence: true
  validates :body, uniqueness: true

  scope :correct, -> { where(correct: true) }

  private

  def validate_answers_count
    if question.answers.count >= 4
      errors.add(:question, "Cannot have more than 4 answers")
    end
  end

  def at_least_one_correct_answer
    if question.answers.where(correct: true).count.zero? && !correct
      errors.add(:question, "Must have at least one correct answer")
    end
  end
end
