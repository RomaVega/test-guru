class CreateTests < ActiveRecord::Migration[8.0]
  def change
    create_table :tests do |t|
      t.string :title, null: false
      t.integer :level, null: false, default: 0
      t.references :category, null: false, foreign_key: true
      t.references :author, null: true, foreign_key: { to_table: :users } # автор теста
      t.timestamps
    end
  end
end
