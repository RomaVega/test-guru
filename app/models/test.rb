class Test < ApplicationRecord
  def self.by_category(category_name)
    joins(:category).where(categories: { title: category_name }).order(title: :desc)
  end
end
