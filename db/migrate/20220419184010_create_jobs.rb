class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.string :name
      t.datetime :start_date
      t.datetime :end_date
      t.string :crew
      t.float :man_hours
      t.string :phase
      t.string :division
      t.float :total_cost
      t.float :sub_cost
      t.float :hours_per_week
      t.float :weeks
      t.float :week_remaining
      t.float :hours_remaining
      t.float :three_month_hours
      t.float :six_month_hours
      t.float :nine_month_hours
      t.float :twelve_month_hours

      t.timestamps
    end
  end
end
