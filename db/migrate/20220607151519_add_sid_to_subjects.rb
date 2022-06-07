class AddSidToSubjects < ActiveRecord::Migration[6.1]
  def change
    add_column :subjects, :sid, :string
  end
end
