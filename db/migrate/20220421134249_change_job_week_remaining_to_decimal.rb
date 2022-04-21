class ChangeJobWeekRemainingToDecimal < ActiveRecord::Migration[7.0]
  def change
    change_column :jobs, :week_remaining, :decimal, :precision => 15, :scale => 2, null: false
    change_column :jobs, :weeks, :decimal, :precision => 15, :scale => 2, null: false
    change_column :jobs, :total_cost, :decimal, :precision => 15, :scale => 2, null: false
    change_column :jobs, :sub_cost, :decimal, :precision => 15, :scale => 2, null: false
    change_column :jobs, :hours_per_week, :decimal, :precision => 15, :scale => 2, null: false
    change_column :jobs, :man_hours, :decimal, :precision => 15, :scale => 2, null: false
    change_column :jobs, :hours_remaining, :decimal, :precision => 15, :scale => 2, null: false
    change_column :jobs, :three_month_hours, :decimal, :precision => 15, :scale => 2, null: false
    change_column :jobs, :six_month_hours, :decimal, :precision => 15, :scale => 2, null: false
    change_column :jobs, :nine_month_hours, :decimal, :precision => 15, :scale => 2, null: false
    change_column :jobs, :twelve_month_hours, :decimal, :precision => 15, :scale => 2, null: false
  end
end