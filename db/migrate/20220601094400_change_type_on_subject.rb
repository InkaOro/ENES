class ChangeTypeOnSubject < ActiveRecord::Migration[6.1]
  def change
    rename_column :subjects, :type, :stype
  end
end
