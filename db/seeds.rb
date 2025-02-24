# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Clean to avoid duplication on next the launch
User.destroy_all
Category.destroy_all
Test.destroy_all
Question.destroy_all
Answer.destroy_all

# Create users
user1 = User.create!(name: "Петя", email: "peterbu@gmail.com")
user2 = User.create!(name: "Сёма", email: "semen@gmail.com")
user3 = User.create!(name: "Ефим", email: "efi@gmail.com")

# Create categories
category_rails_models = Category.create!(title: "Models")
category_rails_views = Category.create!(title: "Views")
category_rails_controllers = Category.create!(title: "Controllers")

# Create tests
test1 = Test.create!(title: "Active Record Basics", level: 1, category: category_rails_models)
test2 = Test.create!(title: "Action View Overview", level: 1, category: category_rails_views)
test3 = Test.create!(title: "Action Controller Overview", level: 1, category: category_rails_controllers)

# User actions test
TestPassage.create!(user: user1, test: test1, completed: true)
TestPassage.create!(user: user2, test: test2, completed: false)
TestPassage.create!(user: user3, test: test3, completed: true)
