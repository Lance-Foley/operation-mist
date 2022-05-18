class ChangeToCrewColumnJobsAndEmployees < ActiveRecord::Migration[7.0]
  def change
    rename_column :jobs, :crew_id, :crew
    rename_column :employees, :crew_id, :crew
  end
end
