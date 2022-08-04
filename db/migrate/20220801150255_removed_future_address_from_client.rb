class RemovedFutureAddressFromClient < ActiveRecord::Migration[7.0]
  def change
    remove_column :clients, :future_address
  end
end
