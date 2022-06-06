class RemoveSubjectfromTest < ActiveRecord::Migration[6.1]
  def change
    remove_column :tests, :subject
    add_reference :tests, :subject, foreign_key: true
  end
end
