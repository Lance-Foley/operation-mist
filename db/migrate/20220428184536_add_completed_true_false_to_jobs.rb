class AddCompletedTrueFalseToJobs < ActiveRecord::Migration[7.0]
  def change
    add_column :jobs, :completed, :boolean, default: false
  end
end
