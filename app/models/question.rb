class Question < ApplicationRecord
  belongs_to :test

  has_many :answers, dependent: :destroy

  validates :body, presence: true
  validates :body, uniqueness: true
  validate :answers_count_within_limit
  validate :must_have_one_correct_answer

  private

  def answers_count_within_limit
    count = answers.count # Запрос в БД, учитывает только сохранённые ответы
    if count > 4
    errors.add(:answers, "Must have between 1 and 4 answers")
    end
  end

  def must_have_one_correct_answer
    return if answers.empty?

    if answers.where(correct: true).count < 1
      errors.add(:answers, "Must be 1 correct answer and 3 incorrect")
    end
  end
end
