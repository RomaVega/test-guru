class User < ApplicationRecord
  has_many :tests, class_name: "Test", foreign_key: "author_id"
  has_many :tests, through: :test_passages
  has_many :test_passages
  def tests_by_difficulty(level)
    tests.where(level: level).distinct
  end
end
