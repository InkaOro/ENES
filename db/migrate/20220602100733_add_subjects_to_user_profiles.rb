class AddSubjectsToUserProfiles < ActiveRecord::Migration[6.1]
  def change
    add_column :user_profiles, :main_subject, :string
    add_column :user_profiles, :specific_subject_a, :string
    add_column :user_profiles, :specific_subject_b, :string
    add_column :user_profiles, :optional_subject, :string
  end
end
