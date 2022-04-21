class CreateCrews < ActiveRecord::Migration[7.0]
  def change
    create_table :crews do |t|
      t.string :name
      t.float :contracted_hours_per_week
      t.float :available_hours_per_week
      t.float :contracted_hours_per_month
      t.float :available_hours_per_month
      t.float :contracted_hours_three_months
      t.float :available_hours_three_months
      t.float :contracted_hours_six_months
      t.float :available_hours_six_months
      t.float :contracted_hours_nine_months
      t.float :available_hours_nine_months
      t.float :contracted_hours_twelve_months
      t.float :available_hours_twelve_months

      t.timestamps
    end
  end
end
