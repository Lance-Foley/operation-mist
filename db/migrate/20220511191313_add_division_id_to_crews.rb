class AddDivisionIdToCrews < ActiveRecord::Migration[7.0]
  def change
    add_column :crews, :division_id, :integer, :default => 0
  end
end
