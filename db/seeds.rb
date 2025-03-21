# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Очистка данных перед сидингом
TestPassage.destroy_all
Answer.destroy_all
Question.destroy_all
Test.destroy_all
Category.destroy_all
User.destroy_all

# Создание пользователей
user1 = User.create!(name: "Petr", email: "peterbu@gmail.com")
user2 = User.create!(name: "Semen", email: "semen@gmail.com")
user3 = User.create!(name: "Efim", email: "efi@gmail.com")
user4 = User.create!(name: "Elena", email: "elena@example.com")

# Создание категорий
category_rails_models = Category.create!(title: "Models")
category_rails_views = Category.create!(title: "Views")
category_rails_controllers = Category.create!(title: "Controllers")
category_rails_routes = Category.create!(title: "Routes")

puts "Создано категорий: #{Category.count}"

# Создание тестов
test1 = Test.create!(title: "Active Record Basics", level: 1, category: category_rails_models, author: user1)
test2 = Test.create!(title: "Action View Overview", level: 2, category: category_rails_views, author: user2)
test3 = Test.create!(title: "Action Controller Overview", level: 7, category: category_rails_controllers, author: user3)
test4 = Test.create!(title: "Rails Routing", level: 3, category: category_rails_routes, author: user4)

puts "Создано тестов: #{Test.count}"

# Создание вопросов
question1 = Question.create!(body: "Что такое Active Record?", test: test1)
question2 = Question.create!(body: "Какой метод используется для рендеринга шаблонов в Rails?", test: test2)
question3 = Question.create!(body: "Что делает before_action в контроллере?", test: test3)
question4 = Question.create!(body: "Какой HTTP-метод используется для создания ресурса?", test: test4)
question5 = Question.create!(body: "Какой метод обновляет запись в Active Record?", test: test1)

# Создание ответов
Answer.create!(body: "Это ORM для работы с БД", question: question1, correct: true)
Answer.create!(body: "Это замена SQL", question: question1, correct: false)
Answer.create!(body: "Это программное обеспечение для работы с файлами", question: question1, correct: false)

Answer.create!(body: "Метод render", question: question2, correct: true)
Answer.create!(body: "Метод view", question: question2, correct: false)
Answer.create!(body: "Метод partial", question: question2, correct: false)

Answer.create!(body: "Вызывает метод перед выполнением действия", question: question3, correct: true)
Answer.create!(body: "Запускает новый поток выполнения", question: question3, correct: false)
Answer.create!(body: "Вызывает внешний API перед действием", question: question3, correct: false)

Answer.create!(body: "POST", question: question4, correct: true)
Answer.create!(body: "GET", question: question4, correct: false)
Answer.create!(body: "DELETE", question: question4, correct: false)

Answer.create!(body: "update", question: question5, correct: true)
Answer.create!(body: "change", question: question5, correct: false)
Answer.create!(body: "modify", question: question5, correct: false)

puts "Создано вопросов: #{Question.count}"
puts "Создано ответов: #{Answer.count}"

# Симуляция прохождения тестов пользователями
TestPassage.create!(user: user1, test: test1, completed: true)
TestPassage.create!(user: user2, test: test2, completed: false)
TestPassage.create!(user: user3, test: test3, completed: true)
TestPassage.create!(user: user4, test: test4, completed: true)

puts "Создано попыток прохождения тестов: #{TestPassage.count}"
