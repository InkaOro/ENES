class RemoveTypeFromSubjects < ActiveRecord::Migration[6.1]
  def change
    remove_column :subjects, :stype
  end
end
