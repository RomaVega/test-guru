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
TestPassage.destroy_all
Answer.destroy_all
Question.destroy_all
Test.destroy_all
Category.destroy_all
User.destroy_all

# Create users
user1 = User.create!(name: "Петя", email: "peterbu@gmail.com")
user2 = User.create!(name: "Сёма", email: "semen@gmail.com")
user3 = User.create!(name: "Ефим", email: "efi@gmail.com")

# Create categories
category_rails_models = Category.create!(title: "Models")
category_rails_views = Category.create!(title: "Views")
category_rails_controllers = Category.create!(title: "Controllers")
puts "Созданы категорий: #{Category.count}"

# Create tests
test1 = Test.create!(title: "Active Record Basics", level: 1, category: category_rails_models, author: user1)
test2 = Test.create!(title: "Action View Overview", level: 1, category: category_rails_views, author: user2)
test3 = Test.create!(title: "Action Controller Overview", level: 1, category: category_rails_controllers, author: user3)
puts "Создано тестов: #{Test.count}"

# Create questions
question1 = Question.create!(body: "Что такое Active Record?", test_id: test1.id)
question2 = Question.create!(body: "Какой метод используется для рендеринга шаблонов в Rails?", test_id: test2.id)
question3 = Question.create!(body: "Что делает before_action в контроллере?", test_id: test3.id)

# Create answers
Answer.create_answer(body: "Это ORM для работы с БД", question: question1, correct: true)
Answer.create_answer(body: "Это замена SQL", question: question1, correct: false)

Answer.create_answer(body: "Метод render", question: question2, correct: true)
Answer.create_answer(body: "Метод view", question: question2, correct: false)

Answer.create_answer(body: "Вызывает метод перед выполнением действия", question: question3, correct: true)
Answer.create_answer(body: "Выполняет проверку перед действием", question: question3, correct: false)


# User actions test
user1.passed_tests << test1
user2.passed_tests << test2
user3.passed_tests << test3

# User actions test
TestPassage.create!(user: user1, test: test1, completed: true)
TestPassage.create!(user: user2, test: test2, completed: false)
TestPassage.create!(user: user3, test: test3, completed: true)

puts "Создано попыток прохождения тестов: #{TestPassage.count}"
