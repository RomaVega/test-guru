class ChangeBodyNullConstraintOnAnswers < ActiveRecord::Migration[8.0]
  def change
    change_column_null :answers, :body, true
  end
end
