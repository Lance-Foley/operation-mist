class SetDefaultValues < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :role, :integer, :default => 0
    change_column :jobs, :total_cost, :decimal, :default => 0
    change_column :jobs, :sub_cost, :decimal, :default => 0
    change_column :employees, :man_hours_per_week, :float, :default => 40
  end
end
