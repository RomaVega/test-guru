class Question < ApplicationRecord
  belongs_to :test
  belongs_to :correct_answer, class_name: "Answer", optional: true
  has_many :answers, dependent: :destroy

  validates :body, presence: true
  validates :body, uniqueness: true
end
