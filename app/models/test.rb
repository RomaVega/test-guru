class Test < ApplicationRecord
  def self.by_category_name(category_title)
    joins("INNER JOIN categories ON tests.category_id = categories.id")
      .where("categories.title = ?", category_title)
      .order(title: :desc)
      .pluck(:title)
  end
end
