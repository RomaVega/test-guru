class TestPassage < ApplicationRecord
  SUCCESSFUL_RATE = 85
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: "Question", optional: true

  validates :correct_questions, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validate :test_has_questions, on: :create

  before_validation :set_first_question, on: :create

  def accept!(answer_ids)
    return if completed?
    self.correct_questions ||= 0
    self.correct_questions += 1 if correct_answer?(answer_ids)
    update_next_question
    save!
  end

  def completed?
    current_question.nil?
  end

  def success_percentage
    (correct_questions.to_f / test.questions.count * 100).round
  end

  def passed?
    success_percentage >= SUCCESSFUL_RATE
  end

  private

  def set_first_question
    self.current_question = test.questions.order(:id).first if test.present?
  end

  def update_next_question
    self.current_question = test.questions.order(:id).where("id > ?", current_question&.id).first
    update_columns(current_question_id: current_question&.id, completed: current_question.nil?)
  end

  def correct_answer?(answer_ids)
    return false unless current_question
    current_question.answers.correct.pluck(:id).sort == Array(answer_ids).map(&:to_i).sort
  end

  def test_has_questions
    errors.add(:base, "Test doesn't have questions") if test.questions.empty?
  end
end
