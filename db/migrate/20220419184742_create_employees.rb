class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :crew
      t.string :division
      t.float :man_hours_per_week
      t.float :man_hours_per_month
      t.float :man_hours_three_months
      t.float :man_hours_six_months
      t.float :man_hours_nine_months
      t.float :man_hours_twelve_months
      t.float :contr_hours_per_week
      t.float :contr_hour_per_month
      t.float :contr_hours_three_months
      t.float :contr_hours_nine_months
      t.float :contr_hours_twelve_months

      t.timestamps
    end
  end
end
