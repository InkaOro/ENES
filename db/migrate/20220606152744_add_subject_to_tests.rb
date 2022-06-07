class AddSubjectToTests < ActiveRecord::Migration[6.1]
  def change
    rename_column :tests, :test_score, :score
  end
end
