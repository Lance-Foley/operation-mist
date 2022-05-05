class ChangeJobNameAddAssoications < ActiveRecord::Migration[7.0]
  def change
    remove_column :jobs, :client_id, :bigint
    add_column :jobs, :project_id, :bigint

  end
end
