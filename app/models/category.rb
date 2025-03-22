class Category < ApplicationRecord
  default_scope { order(title: :asc) }

  has_many :tests, dependent: :destroy

  validates :title, presence: true, uniqueness: true, length: { maximum: 50 }, format: {
    with: /\A[a-zA-Z0-9\s]+\z/, message: "Only allows letters, numbers and spaces"
  }
end
