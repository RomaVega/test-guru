class Answer < ApplicationRecord
  belongs_to :question

  validate :validate_answers_count, on: :create
  validate :at_least_one_correct_answer, on: :update

  validates :body, presence: true
  # validates :body, presence: true # uniqueness: { scope: :question_id }

  scope :correct, -> { where(correct: true) }

  after_create :set_question_correct_answer

  private

  def validate_answers_count
    if question.answers.count >= 4
      errors.add(:question, "Cannot have more than 4 answers")
    end
  end

  def at_least_one_correct_answer
    if question.answers.correct.empty? && !correct
      errors.add(:question, "Must have at least one correct answer")
    end
  end

  def set_question_correct_answer
    if correct?
      question.update_column(:correct_answer_id, id)
    end
  end
end
