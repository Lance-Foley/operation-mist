class CreateVariances < ActiveRecord::Migration[7.0]
  def change
    create_table :variances do |t|
      t.decimal :variance

      t.timestamps
    end
  end
end
