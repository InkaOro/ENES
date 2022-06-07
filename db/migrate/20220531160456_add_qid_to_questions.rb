class AddQidToQuestions < ActiveRecord::Migration[6.1]
  def change
    add_column :questions, :qid, :string
    add_reference :questions, :subject, null: false, index: true
  end
end
