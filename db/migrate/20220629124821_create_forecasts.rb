class CreateForecasts < ActiveRecord::Migration[7.0]
  def change
    create_table :forecasts do |t|
      t.string :year, null: false
      t.string :month, null: false
      t.decimal :total_cost, null: false
      t.decimal :total_sub_cost, null: false
      t.timestamps
    end
  end
end

