class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :project_manager

      t.string :client_id

      t.timestamps
    end
  end
end
