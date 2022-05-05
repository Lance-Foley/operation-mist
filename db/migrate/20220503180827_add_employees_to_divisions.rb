class AddEmployeesToDivisions < ActiveRecord::Migration[7.0]
  def change
    add_column :divisions, :employees, :integer
    add_column :divisions, :e_rating, :decimal
    add_column :divisions, :work_load, :decimal
  end
end
