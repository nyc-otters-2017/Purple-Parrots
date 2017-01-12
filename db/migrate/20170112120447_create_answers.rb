class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :user_id
      t.integer :question_id
      t.string :answer, null: false

      t.timestamps(null: false)
    end
  end
end
