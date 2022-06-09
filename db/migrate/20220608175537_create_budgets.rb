class CreateBudgets < ActiveRecord::Migration[7.0]
  def change
    create_table :budgets do |t|
      t.string :account_name
      t.string :description
      t.decimal :income
      t.decimal :balance
      t.decimal :expenses
      t.datetime :start_date
      t.datetime :end_date
      t.timestamps
    end
  end
end
