class CreateTestAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :test_answers do |t|
      t.references :test, null: false, foreign_key: true
      t.references :answer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
