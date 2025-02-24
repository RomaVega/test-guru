class User < ApplicationRecord
  def tests_by_level(level)
    Test.where("tests.level = ? AND tests.id IN (SELECT test_id FROM test_passages WHERE user_id = ?)", level, id)
  end
end
