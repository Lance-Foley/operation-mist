class AddDivisionIdToJobs < ActiveRecord::Migration[7.0]
  def change
    add_column :jobs, :division_id, :bigint
  end
end
