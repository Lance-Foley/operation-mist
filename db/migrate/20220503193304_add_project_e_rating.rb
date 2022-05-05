class AddProjectERating < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :e_rating, :decimal
  end
end
