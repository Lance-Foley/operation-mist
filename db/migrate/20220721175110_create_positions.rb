class CreatePositions < ActiveRecord::Migration[7.0]
  def change
    create_table :positions do |t|
      t.string :name
      t.text :description
      t.boolean :pm

      t.timestamps
    end
  end
end
