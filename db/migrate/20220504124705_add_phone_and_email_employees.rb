class AddPhoneAndEmailEmployees < ActiveRecord::Migration[7.0]
  def change
    add_column :employees, :email, :string
    add_column :employees, :phone_number, :string
  end
end
