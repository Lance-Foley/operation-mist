class AddDefaultRequiredColumns < ActiveRecord::Migration[7.0]
  def change
    change_column :divisions, :e_rating, :decimal, :default => 0
    change_column :divisions, :hours_per_week, :decimal, :default => 0
    change_column :divisions, :three_month_hours, :decimal, :default => 0
    change_column :divisions, :six_month_hours, :decimal, :default => 0
    change_column :divisions, :nine_month_hours, :decimal, :default => 0
    change_column :divisions, :twelve_month_hours, :decimal, :default => 0
    change_column :divisions, :employees, :decimal, :default => 0
    change_column :divisions, :work_load, :decimal, :default => 0
    change_column :employees, :man_hours_per_month, :decimal, :default => 0
    change_column :employees, :man_hours_three_months, :decimal, :default => 0
    change_column :employees, :man_hours_six_months, :decimal, :default => 0
    change_column :employees, :man_hours_twelve_months, :decimal, :default => 0
    change_column :employees, :contr_hour_per_month, :decimal, :default => 0
    change_column :employees, :contr_hours_three_months, :decimal, :default => 0
    add_column :employees, :contr_hours_six_months, :decimal, :default => 0
    change_column :employees, :contr_hours_nine_months, :decimal, :default => 0
    change_column :employees, :contr_hours_twelve_months, :decimal, :default => 0
    remove_column :crews, :e_rating
    remove_column :crews, :employee_sum
    remove_column :crews, :work_load
    rename_column :jobs, :E_rating, :e_rating
    remove_column :phases, :hours_per_week
    remove_column :phases, :hours_per_month
    remove_column :phases, :three_month_hours
    remove_column :phases, :six_month_hours
    remove_column :phases, :nine_month_hours
    remove_column :phases, :twelve_month_hours
    remove_column :projects, :e_rating
    remove_column :crews, :contracted_hours_per_week
    remove_column :crews, :available_hours_per_week
    remove_column :crews, :contracted_hours_per_month
    remove_column :crews, :available_hours_per_month
    remove_column :crews, :contracted_hours_three_months
    remove_column :crews, :available_hours_three_months
    remove_column :crews, :contracted_hours_nine_months
    remove_column :crews, :available_hours_nine_months
    remove_column :crews, :contracted_hours_twelve_months
    remove_column :crews, :available_hours_twelve_months
    remove_column :crews, :contracted_hours_six_months
    remove_column :crews, :available_hours_six_months
  end
end
