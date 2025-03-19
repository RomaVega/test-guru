class Answer < ApplicationRecord
  belongs_to :question

  scope :correct_answers, -> { where(correct: true) }

  validates :body, presence: true
  validates :body, uniqueness: true
  validates :correct, { in: [ true, false ] }
end
