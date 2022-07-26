class AddProjectCostingToProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :material_cost, :decimal
    add_column :projects, :actual_material_cost, :decimal
    add_column :projects, :actual_sub_cost, :decimal
  end
end
