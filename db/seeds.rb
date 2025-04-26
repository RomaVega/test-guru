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
users = [
  User.create!(name: "Petr", email: "peterbu@gmail.com"),
  User.create!(name: "Semen", email: "semen@gmail.com"),
  User.create!(name: "Efim", email: "efi@gmail.com"),
  User.create!(name: "Elena", email: "elena@example.com"),
  User.create!(name: "Anna", email: "anna@example.com"),
  User.create!(name: "Dmitry", email: "dmitry@example.com"),
  User.create!(name: "Olga", email: "olga@example.com"),
  User.create!(name: "Ivan", email: "ivan@example.com")
]

puts "Создано пользователей: #{User.count}"

# Создание категорий
categories = [
  Category.create!(title: "Models"),
  Category.create!(title: "Views"),
  Category.create!(title: "Controllers"),
  Category.create!(title: "Routes"),
  Category.create!(title: "Migrations"),
  Category.create!(title: "Active Record Associations"),
  Category.create!(title: "Action Mailer"),
  Category.create!(title: "Testing in Rails")
]

puts "Создано категорий: #{Category.count}"

# Создание тестов
tests = [
  Test.create!(title: "Active Record Basics", level: 1, category: categories[0], author: users[0]),
  Test.create!(title: "Action View Overview", level: 2, category: categories[1], author: users[1]),
  Test.create!(title: "Action Controller Overview", level: 4, category: categories[2], author: users[2]),
  Test.create!(title: "Rails Routing", level: 3, category: categories[3], author: users[3]),
  Test.create!(title: "Database Migrations", level: 2, category: categories[4], author: users[4]),
  Test.create!(title: "Associations in Rails", level: 3, category: categories[5], author: users[5]),
  Test.create!(title: "Sending Emails with Action Mailer", level: 4, category: categories[6], author: users[6]),
  Test.create!(title: "Writing Tests in Rails", level: 5, category: categories[7], author: users[7]),
  Test.create!(title: "Advanced Active Record", level: 6, category: categories[0], author: users[1]),
  Test.create!(title: "Custom Helpers in Views", level: 2, category: categories[1], author: users[2])
]

puts "Создано тестов: #{Test.count}"

# Создание вопросов
questions = [
  # Вопросы для теста 1: Active Record Basics
  Question.create!(body: "Что такое Active Record?", test: tests[0]),
  Question.create!(body: "Какой метод используется для поиска записи по ID?", test: tests[0]),
  Question.create!(body: "Что делает метод save в Active Record?", test: tests[0]),

  # Вопросы для теста 2: Action View Overview
  Question.create!(body: "Какой метод используется для рендеринга шаблонов в Rails?", test: tests[1]),
  Question.create!(body: "Что такое ERB в контексте Rails?", test: tests[1]),

  # Вопросы для теста 3: Action Controller Overview
  Question.create!(body: "Что делает before_action в контроллере?", test: tests[2]),
  Question.create!(body: "Какой метод используется для редиректа в Rails?", test: tests[2]),

  # Вопросы для теста 4: Rails Routing
  Question.create!(body: "Какой HTTP-метод используется для создания ресурса?", test: tests[3]),
  Question.create!(body: "Что делает resources в маршрутах Rails?", test: tests[3]),

  # Вопросы для теста 5: Database Migrations
  Question.create!(body: "Как создать новую миграцию в Rails?", test: tests[4]),
  Question.create!(body: "Что делает rake db:rollback?", test: tests[4]),

  # Вопросы для теста 6: Associations in Rails
  Question.create!(body: "Что такое belongs_to в Rails?", test: tests[5]),
  Question.create!(body: "Как настроить связь has_many?", test: tests[5]),

  # Вопросы для теста 7: Sending Emails with Action Mailer
  Question.create!(body: "Какой класс используется для отправки писем в Rails?", test: tests[6]),
  Question.create!(body: "Что такое mailer в Rails?", test: tests[6]),

  # Вопросы для теста 8: Writing Tests in Rails
  Question.create!(body: "Какой гем обычно используется для тестирования в Rails?", test: tests[7]),
  Question.create!(body: "Что такое fixtures в контексте тестирования?", test: tests[7]),

  # Вопросы для теста 9: Advanced Active Record
  Question.create!(body: "Что такое scopes в Active Record?", test: tests[8]),
  Question.create!(body: "Как использовать includes для предотвращения N+1 запросов?", test: tests[8]),

  # Вопросы для теста 10: Custom Helpers in Views
  Question.create!(body: "Как создать кастомный хелпер в Rails?", test: tests[9]),
  Question.create!(body: "Где хранятся хелперы в Rails?", test: tests[9])
]

# Создание ответов
answers = [
  # Ответы для вопроса 1
  Answer.create!(body: "Это ORM для работы с БД", question: questions[0], correct: true),
  Answer.create!(body: "Это замена SQL", question: questions[0], correct: false),
  Answer.create!(body: "Это программное обеспечение для работы с файлами", question: questions[0], correct: false),

  # Ответы для вопроса 2
  Answer.create!(body: "find", question: questions[1], correct: true),
  Answer.create!(body: "search", question: questions[1], correct: false),
  Answer.create!(body: "get", question: questions[1], correct: false),

  # Ответы для вопроса 3
  Answer.create!(body: "Сохраняет запись в базе данных", question: questions[2], correct: true),
  Answer.create!(body: "Удаляет запись", question: questions[2], correct: false),
  Answer.create!(body: "Обновляет только атрибуты", question: questions[2], correct: false),

  # Ответы для вопроса 4
  Answer.create!(body: "Метод render", question: questions[3], correct: true),
  Answer.create!(body: "Метод view", question: questions[3], correct: false),
  Answer.create!(body: "Метод partial", question: questions[3], correct: false),

  # Ответы для вопроса 5
  Answer.create!(body: "Это шаблонизатор для вьюх", question: questions[4], correct: true),
  Answer.create!(body: "Это библиотека для рендеринга", question: questions[4], correct: false),
  Answer.create!(body: "Это способ хранения данных", question: questions[4], correct: false),

  # Ответы для вопроса 6
  Answer.create!(body: "Вызывает метод перед выполнением действия", question: questions[5], correct: true),
  Answer.create!(body: "Запускает новый поток выполнения", question: questions[5], correct: false),
  Answer.create!(body: "Вызывает внешний API перед действием", question: questions[5], correct: false),

  # Ответы для вопроса 7
  Answer.create!(body: "redirect_to", question: questions[6], correct: true),
  Answer.create!(body: "goto", question: questions[6], correct: false),
  Answer.create!(body: "forward", question: questions[6], correct: false),

  # Ответы для вопроса 8
  Answer.create!(body: "POST", question: questions[7], correct: true),
  Answer.create!(body: "GET", question: questions[7], correct: false),
  Answer.create!(body: "DELETE", question: questions[7], correct: false),

  # Ответы для вопроса 9
  Answer.create!(body: "Создаёт стандартные маршруты для RESTful-ресурса", question: questions[8], correct: true),
  Answer.create!(body: "Определяет только один маршрут", question: questions[8], correct: false),
  Answer.create!(body: "Создаёт маршруты только для чтения", question: questions[8], correct: false),

  # Ответы для вопроса 10
  Answer.create!(body: "rails generate migration", question: questions[9], correct: true),
  Answer.create!(body: "rails create migration", question: questions[9], correct: false),
  Answer.create!(body: "rails new migration", question: questions[9], correct: false),

  # Ответы для вопроса 11
  Answer.create!(body: "Откатывает последнюю миграцию", question: questions[10], correct: true),
  Answer.create!(body: "Удаляет базу данных", question: questions[10], correct: false),
  Answer.create!(body: "Применяет все миграции заново", question: questions[10], correct: false),

  # Ответы для вопроса 12
  Answer.create!(body: "Определяет связь 'принадлежит' с другой моделью", question: questions[11], correct: true),
  Answer.create!(body: "Создаёт новую таблицу", question: questions[11], correct: false),
  Answer.create!(body: "Определяет связь один-ко-многим", question: questions[11], correct: false),

  # Ответы для вопроса 13
  Answer.create!(body: "Добавляет has_many в модель", question: questions[12], correct: true),
  Answer.create!(body: "Добавляет belongs_to в модель", question: questions[12], correct: false),
  Answer.create!(body: "Создаёт полиморфную связь", question: questions[12], correct: false),

  # Ответы для вопроса 14
  Answer.create!(body: "ActionMailer::Base", question: questions[13], correct: true),
  Answer.create!(body: "MailSender", question: questions[13], correct: false),
  Answer.create!(body: "EmailController", question: questions[13], correct: false),

  # Ответы для вопроса 15
  Answer.create!(body: "Класс для отправки писем", question: questions[14], correct: true),
  Answer.create!(body: "Шаблон для вьюх", question: questions[14], correct: false),
  Answer.create!(body: "Модель для хранения писем", question: questions[14], correct: false),

  # Ответы для вопроса 16
  Answer.create!(body: "rspec-rails", question: questions[15], correct: true),
  Answer.create!(body: "test-unit", question: questions[15], correct: false),
  Answer.create!(body: "rails-test", question: questions[15], correct: false),

  # Ответы для вопроса 17
  Answer.create!(body: "Данные для тестов", question: questions[16], correct: true),
  Answer.create!(body: "Методы для тестирования", question: questions[16], correct: false),
  Answer.create!(body: "Шаблоны для вьюх", question: questions[16], correct: false),

  # Ответы для вопроса 18
  Answer.create!(body: "Способы фильтрации данных", question: questions[17], correct: true),
  Answer.create!(body: "Методы для валидации", question: questions[17], correct: false),
  Answer.create!(body: "Способы рендеринга", question: questions[17], correct: false),

  # Ответы для вопроса 19
  Answer.create!(body: "Предварительно загружает связанные данные", question: questions[18], correct: true),
  Answer.create!(body: "Создаёт новые записи", question: questions[18], correct: false),
  Answer.create!(body: "Удаляет связанные записи", question: questions[18], correct: false),

  # Ответы для вопроса 20
  Answer.create!(body: "Определить метод в модуле ApplicationHelper", question: questions[19], correct: true),
  Answer.create!(body: "Создать новый контроллер", question: questions[19], correct: false),
  Answer.create!(body: "Добавить метод в модель", question: questions[19], correct: false),

  # Ответы для вопроса 21
  Answer.create!(body: "В app/helpers", question: questions[20], correct: true),
  Answer.create!(body: "В app/controllers", question: questions[20], correct: false),
  Answer.create!(body: "В app/models", question: questions[20], correct: false)
]

puts "Создано вопросов: #{Question.count}"
puts "Создано ответов: #{Answer.count}"

# Симуляция прохождения тестов пользователями
users.each do |user|
  tests.sample(rand(3..6)).each do |test|
    TestPassage.create!(
      user: user,
      test: test,
      completed: [ true, false ].sample,
      created_at: rand(1..30).days.ago # Добавляем случайную дату создания для реалистичности
    )
  end
end

puts "Создано попыток прохождения тестов: #{TestPassage.count}"
