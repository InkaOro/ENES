class CreateUserSubjects < ActiveRecord::Migration[6.1]
  def change
    create_table :user_subjects do |t|
      t.references :subject, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
