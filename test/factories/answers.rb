FactoryBot.define do
  factory :answer do
    body { "A programming language" }
    correct { false }
    question # Ассоциация с вопросом
  end
end
