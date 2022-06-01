class RemoveQuestionTypeFromQuestions < ActiveRecord::Migration[6.1]
  def change
    remove_column :questions, :question_type, :string
  end
end
