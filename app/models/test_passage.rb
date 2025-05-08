class TestPassage < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :test
  belongs_to current_question, class_name: "Question", optional: true

  validates :correct_questions, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validate :test_has_questions, on: :create
end
