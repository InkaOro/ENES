class AddColorToSubjects < ActiveRecord::Migration[6.1]
  def change
    add_column :subjects, :color, :string
  end
end
