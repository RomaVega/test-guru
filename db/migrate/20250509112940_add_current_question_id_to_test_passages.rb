class AddCurrentQuestionIdToTestPassages < ActiveRecord::Migration[8.0]
  def change
    add_reference :test_passages, :current_question, index: true
    change_column :test_passages, :correct_questions, :integer, default: 0, null: false
    add_foreign_key :test_passages, :questions, column: :current_question_id
  end
end
