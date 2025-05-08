class Question < ApplicationRecord
  SUCCESSFUL_RATE = 85
  belongs_to :test
  belongs_to :current_question, class_name: "Question", optional: true
  belongs_to :user, optional: true

  has_many :answers, dependent: :destroy

  validates :body, presence: true
  validates :body, uniqueness: true
end
