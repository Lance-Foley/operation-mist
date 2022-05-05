class RemoveColumnsFromDivision < ActiveRecord::Migration[7.0]
  def change
    remove_column :divisions, :hours_per_week
    remove_column :divisions, :hours_per_month
    remove_column :divisions, :three_month_hours
    remove_column :divisions, :six_month_hours
    remove_column :divisions, :nine_month_hours
    remove_column :divisions, :twelve_month_hours
    remove_column :divisions, :employees
    remove_column :divisions, :e_rating
    remove_column :divisions, :work_load
    remove_column :employees, :contr_hours_per_week
    remove_column :employees, :contr_hour_per_month
    remove_column :employees, :contr_hours_three_months
    remove_column :employees, :contr_hours_six_months
    remove_column :employees, :contr_hours_nine_months
    remove_column :employees, :contr_hours_twelve_months
    change_column :employees, :man_hours_nine_months, :decimal, :default => 0
  end
end
