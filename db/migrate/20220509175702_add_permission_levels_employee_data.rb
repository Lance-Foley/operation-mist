class AddPermissionLevelsEmployeeData < ActiveRecord::Migration[7.0]
  def change
    add_column :employees, :tier, :integer
    add_column :projects, :cost, :decimal
    add_column :projects, :sub_cost, :decimal
    add_column :projects, :start_date, :date
    add_column :projects, :end_date, :date

    change_column :jobs, :start_date, :date
    change_column :jobs, :end_date, :date
  end
end
