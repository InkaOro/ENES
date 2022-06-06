class AddSubjectToTests < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :subject, :string
    rename_column :tests, :test_score, :score
  end
end
