class CreatePhases < ActiveRecord::Migration[7.0]
  def change
    create_table :phases do |t|
      t.string :name
      t.float :hours_per_week
      t.float :hours_per_month
      t.float :three_month_hours
      t.float :six_month_hours
      t.float :nine_month_hours
      t.float :twelve_month_hours

      t.timestamps
    end
  end
end
