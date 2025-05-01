class AddCorrectAnswerIdToQuestions < ActiveRecord::Migration[8.0]
  def change
    add_column :questions, :correct_answer_id, :integer
  end
end
