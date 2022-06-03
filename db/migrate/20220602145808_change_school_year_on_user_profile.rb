class ChangeSchoolYearOnUserProfile < ActiveRecord::Migration[6.1]
  def change
    change_column :user_profiles, :school_year, :string
  end
end
