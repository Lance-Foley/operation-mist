class ChangeJobTableColumnCrewToCrewName < ActiveRecord::Migration[7.0]
  def change
    rename_column :jobs, :crew, :crew_name
    rename_column :jobs, :division, :division_name

    rename_column :employees, :crew, :crew_name
    
  end
end
