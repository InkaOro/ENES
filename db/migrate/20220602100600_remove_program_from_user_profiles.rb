class RemoveProgramFromUserProfiles < ActiveRecord::Migration[6.1]
  def change
    remove_column :user_profiles, :program
  end
end
