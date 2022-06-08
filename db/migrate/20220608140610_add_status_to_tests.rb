class AddStatusToTests < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :status, :integer, default: 0
  end
end
