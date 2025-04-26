class AddCurrentQuestionToTestPassages < ActiveRecord::Migration[8.0]
  def change
    # Step 1: Add the column without NOT NULL constraint
    add_reference :test_passages, :current_question, foreign_key: { to_table: :questions }

    # Step 2: Backfill the column with default values (if needed)
    # Uncomment the following line if you want to set a default value for existing rows
    # TestPassage.update_all(current_question_id: NULL)

    # Step 3: Add NOT NULL constraint (if required)
    change_column_null :test_passages, :current_question_id, false
  end
end
