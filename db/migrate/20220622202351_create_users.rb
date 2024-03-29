class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :roles do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
    create_table :users do |t|
      t.string :name
      t.belongs_to :role, null: false, foreign_key: true

      t.timestamps
    end
  end
end
