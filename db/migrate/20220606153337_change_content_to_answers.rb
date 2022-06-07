class ChangeContentToAnswers < ActiveRecord::Migration[6.1]
  def change
    rename_column :answers, :answer_content, :content
    add_reference :tests, :subject, null: false, index: true
  end
end
