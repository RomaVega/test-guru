class User < ApplicationRecord
  def tests_by_level(level)
    Test.joins(:test_passages)
        .where(test_passages: { user_id: id, completed: true })
        .where(level: level)
        .distinct
        .pluck(:title)
  end
end
