class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validates :body, uniqueness: true

  scope :correct, -> { where(correct: true) }
end
