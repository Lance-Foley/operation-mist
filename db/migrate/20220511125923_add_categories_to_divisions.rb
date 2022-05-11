class AddCategoriesToDivisions < ActiveRecord::Migration[7.0]
  def change
    add_column :divisions, :utilization, :integer, default: 0
  end
end
