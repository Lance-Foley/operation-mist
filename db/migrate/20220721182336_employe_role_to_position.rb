class EmployeRoleToPosition < ActiveRecord::Migration[7.0]
  def change
    rename_column :employees, :role, :position
  end
end
