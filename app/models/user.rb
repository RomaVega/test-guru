class User < ApplicationRecord
  has_many :tests, class_name: "Test", foreign_key: "author_id"
  def tests_by_difficulty(level)
    Test.joins("INNER JOIN test_passages ON tests.id = test_passages.test_id")
        .where("test_passages.user_id = ?", self.id)
        .where(level: level)
        .distinct
  end
end
