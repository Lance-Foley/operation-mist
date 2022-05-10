class AddCrewToJobs < ActiveRecord::Migration[7.0]
  def change
    add_column :crews, :job_id, :bigint
  end
end
