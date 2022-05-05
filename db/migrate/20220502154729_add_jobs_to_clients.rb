class AddJobsToClients < ActiveRecord::Migration[7.0]
  def change
    remove_column :clients, :jobs_id, :bigint
    remove_column :jobs, :client_id, :bigint
  end
end
