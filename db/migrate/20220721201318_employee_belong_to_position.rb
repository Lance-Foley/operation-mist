class EmployeeBelongToPosition < ActiveRecord::Migration[7.0]
  def change
    add_column :employees, :position_id, :bigint

  end
end
