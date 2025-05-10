class User < ApplicationRecord
  has_many :created_tests, class_name: "Test", foreign_key: "author_id"
  has_many :test_passages
  has_many :passed_tests, through: :test_passages, source: :test
  has_many :tests

  validates :name, presence: true # format: { with: /\A[A-Za-z][A-Za-z0-9._-]{2,19}\z/ }
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  def passed_tests_by_level(level)
    passed_tests.where(level: level).distinct
  end
end
