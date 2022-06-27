class DropTablename < ActiveRecord::Migration[7.0]
  def change
    drop_table :users
    drop_table :roles
  end
end
