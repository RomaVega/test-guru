class User < ApplicationRecord
  has_many :created_tests, class_name: "Test", foreign_key: "author_id"
  has_many :test_passages
  has_many :passed_tests, through: :test_passages, source: :test

  def tests_by_difficulty(level)
    passed_tests.where(level: level).distinct
  end
end
