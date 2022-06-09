class AddFinanceDataToProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :number_of_days, :float, default: 0, null: false
    add_column :projects, :sub_cost_per_day, :decimal, default: 0, null: false
    add_column :projects, :project_cost_per_day, :decimal, default: 0, null: false
    add_column :projects, :total_cost_per_day, :decimal, default: 0, null: false

    change_column :projects, :cost, :decimal, :default => 0
    change_column :projects, :sub_cost, :decimal, :default => 0
  end
end
