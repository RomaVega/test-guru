class CreateCategories < ActiveRecord::Migration[8.0]
  def change
    create_table :categories do |t|
      t.string :title, null: false

      t.timestamps

      add_index :categories, :title, unique: true
    end
  end
end
