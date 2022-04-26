class ChangeUserColumnsRolesNames < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :Roles, :role
    rename_column :users, :writing, :name
  end
end
