class AddERatingToCrews < ActiveRecord::Migration[7.0]
  def change
    add_column :crews, :e_rating, :decimal
    add_column :crews, :work_load, :decimal
    add_column :crews, :employee_sum, :integer
  end
end
