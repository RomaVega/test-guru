class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User", foreign_key: "author_id"

  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages

  validates :title, presence: true

  scope :easy_lvl, -> { where(level: [ 0, 1 ]) }
  scope :medium_lvl, -> { where(level: [ 2, 3, 4 ]) }
  scope :hard_lvl, -> { where(level: (5..Float::INFINITY)) }

  def self.all_titles
    pluck(:title)
  end
end
