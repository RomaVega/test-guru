class CreateTestPassages < ActiveRecord::Migration[8.0]
  def change
    create_table :test_passages do |t|
      t.references :user, null: false, foreign_key: true
      t.references :test, null: false, foreign_key: true
      t.integer :correct_questions
      t.boolean :completed, default: false
      t.timestamps
    end
  end
end
