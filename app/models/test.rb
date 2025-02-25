class Test < ApplicationRecord
  def self.by_category(category_name)
      where("category_id IN (SELECT id FROM categories WHERE title = ?)", category_name)
      .order(title: :desc)
      .pluck(:title)
  end
end
