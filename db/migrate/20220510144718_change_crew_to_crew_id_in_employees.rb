class ChangeCrewToCrewIdInEmployees < ActiveRecord::Migration[7.0]
  def change
    rename_column :employees, :crew, :crew_id

  end
end
