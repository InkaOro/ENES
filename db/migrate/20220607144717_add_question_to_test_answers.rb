class AddQuestionToTestAnswers < ActiveRecord::Migration[6.1]
  def change
    add_reference :test_answers, :question, null: false, foreign_key: true
  end
end
