class AddJobReferenceClient < ActiveRecord::Migration[7.0]
  def change
    change_table "jobs", force: :cascade do |t|
      t.belongs_to :client
    end
    
  end
end
