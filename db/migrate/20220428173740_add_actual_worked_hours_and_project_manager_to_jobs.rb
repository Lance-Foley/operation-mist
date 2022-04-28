class AddActualWorkedHoursAndProjectManagerToJobs < ActiveRecord::Migration[7.0]
  def change
    add_column :jobs, :project_manager, :string
    add_column :jobs, :actual_worked_hours, :decimal
  end
end
