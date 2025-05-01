class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: "Question", optional: true

  after_save :set_next_question

  def completed?
    completed || current_question.nil?
  end

  def accept!(answer_id)
    return if completed?

    answer = Answer.find(answer_id)

    self.correct_questions = (correct_questions || 0) + 1 if answer.correct

    save!
  end

  def success_percentage
    return 0 if total_questions.zero?
    ((correct_questions || 0).to_f / total_questions * 100).round
  end

  def passed?
    success_percentage >= 85
  end

  def current_question_number
    return 0 if current_question.nil?
    test.questions.order(:id).index(current_question) + 1
  end

  def total_questions
    test.questions.count
  end

  private

  def set_next_question
    questions = test.questions.order(:id)
    if current_question.nil?
      self.current_question = questions.first
    else
      current_index = questions.index(current_question)
      if current_index && current_index + 1 < questions.count
        self.current_question = questions[current_index + 1]
      else
        self.current_question = nil
        self.completed = true
      end
    end
    update_columns(current_question_id: current_question&.id, completed: completed)
  end
end
