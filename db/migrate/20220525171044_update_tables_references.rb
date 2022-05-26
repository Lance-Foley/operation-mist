class UpdateTablesReferences < ActiveRecord::Migration[7.0]
  def change

    change_column :jobs, :project_id, :bigint, foreign_keys: true

    change_column :projects, :client_id, :bigint, foreign_keys: true

    change_column :crews, :division_id, :bigint, foreign_keys: true

  end
end
