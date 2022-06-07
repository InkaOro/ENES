class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.string :type
      t.text :question_content
      t.integer :question_score

      t.timestamps
    end
  end
end
