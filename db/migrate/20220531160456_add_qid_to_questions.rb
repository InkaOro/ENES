class AddQidToQuestions < ActiveRecord::Migration[6.1]
  def change
    add_column :questions, :qid, :string
  end
end
