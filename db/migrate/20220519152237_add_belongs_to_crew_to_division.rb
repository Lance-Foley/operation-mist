class AddBelongsToCrewToDivision < ActiveRecord::Migration[7.0]
  def change
    change_column :crews, :division_id, :bigint, index: true, foreign_keys: true

  end
end
