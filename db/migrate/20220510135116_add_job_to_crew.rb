class AddJobToCrew < ActiveRecord::Migration[7.0]
  def change
    remove_column :crews, :job_id, :bigint
    add_column :jobs, :crew_id, :bigint
  end
end
