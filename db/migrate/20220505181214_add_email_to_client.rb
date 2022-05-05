class AddEmailToClient < ActiveRecord::Migration[7.0]
  def change
    add_column :clients, :email, :string
  end
end
