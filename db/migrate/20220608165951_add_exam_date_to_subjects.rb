class AddExamDateToSubjects < ActiveRecord::Migration[6.1]
  def change
    add_column :subjects, :exam_date, :date
  end
end
