class AddCurrentQuestionIdToTestPassages < ActiveRecord::Migration[8.0]
  def change
    add_reference :test_passages, :current_question, foreign_key: { to_table: :questions }, null: true
  end
end
