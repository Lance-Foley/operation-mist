class AddTrueManHoursPerWeekToEmployee < ActiveRecord::Migration[7.0]
  def change
    add_column :employees, :true_man_hours_per_week, :float
  end
end
