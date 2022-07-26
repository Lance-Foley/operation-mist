class AddDefaultValues < ActiveRecord::Migration[7.0]
  def change
    change_column :projects, :material_cost, :decimal, :default => 0
    change_column :projects, :actual_material_cost, :decimal, :default => 0
    change_column :projects, :actual_sub_cost, :decimal, :default => 0
  end
end
