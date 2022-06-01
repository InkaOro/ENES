class ChangeTypeOnQuestions < ActiveRecord::Migration[6.1]
  def change
    rename_column :questions, :type, :question_type
  end
end
