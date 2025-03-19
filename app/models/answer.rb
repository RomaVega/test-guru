class Answer < ApplicationRecord
  belongs_to :question

  scope :correct_answers, -> { where(correct: true) }

  validates :body, presence: true, uniqueness: true
  validates :correct, { in: [ true, false ] }
  validates :question_id, numericality: { only_integer: true }, presence: true, uniqueness: true
end
