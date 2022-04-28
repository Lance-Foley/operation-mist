class AddERatingToJobs < ActiveRecord::Migration[7.0]
  def change
    add_column :jobs, :E_rating, :decimal, default: 0.0
    change_column :jobs, :actual_worked_hours, :decimal, default: 0
  end
end
