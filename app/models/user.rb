class User < ApplicationRecord
  has_many :created_tests, class_name: "Test", foreign_key: "author_id"
  has_many :test_passages
  has_many :passed_tests, through: :test_passages, source: :test

  validates :name, presence: true, format: { with: /\A[A-Za-z][A-Za-z0-9._-]{2,19}\z/ }
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  scope :passed_tests, ->(level) { where(level: level).distinct }
end
