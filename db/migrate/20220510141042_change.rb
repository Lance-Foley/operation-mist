class Change < ActiveRecord::Migration[7.0]
  def change
    remove_column :jobs, :crew_id
    rename_column :jobs, :crew, :crew_id
  end
end
