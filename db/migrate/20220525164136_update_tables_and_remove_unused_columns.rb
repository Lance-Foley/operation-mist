class UpdateTablesAndRemoveUnusedColumns < ActiveRecord::Migration[7.0]
  def change

    change_table :jobs do |t|
      t.remove :name
      t.remove :total_cost
      t.remove :sub_cost
      t.remove :project_manager
      t.belongs_to :crew
    end

    remove_column :projects, :client_id
    add_column :projects, :client_id, :bigint, foreign_keys: true

    change_table :employees do |t|
      t.belongs_to :crew, foreign_keys: true
    end

    change_table :divisions do |t|
      t.belongs_to :crew
      t.belongs_to :job
    end

    change_column :crews, :division_id, :bigint, foreign_keys: true

    create_table :variances do |t|
      t.decimal :variance
      t.timestamps
    end
  end
end
