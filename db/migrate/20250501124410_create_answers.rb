class CreateAnswers < ActiveRecord::Migration[8.0]
  def change
    create_table :answers, if_not_exists: true do |t|
      t.timestamps
    end
  end
end
