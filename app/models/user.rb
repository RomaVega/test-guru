class User < ApplicationRecord
  def tests_by_level(level)
    Test.where(level: level)
        .where("id IN (SELECT test_id FROM test_passages WHERE user_id = ? AND completed = ?)", id, true)
        .pluck(:title)
  end
end
