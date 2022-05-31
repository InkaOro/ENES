class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.integer :test_score
      t.date :start_time
      t.date :end_time
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
