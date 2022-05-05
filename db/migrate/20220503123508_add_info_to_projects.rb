class AddInfoToProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :info, :text
  end
end
