class AddColumnsToClients < ActiveRecord::Migration[7.0]
  def change
    add_column :clients, :future_address, :string
    add_column :clients, :cell_phone, :string
  end
end
