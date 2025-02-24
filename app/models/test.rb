class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'
  def self.by_category(category_name)
    joins(:category)
      .where(categories: { title: category_name })
      .order(title: :desc)
      .pluck(:title)
  end
end
