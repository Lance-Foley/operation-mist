class AddJobsToClient < ActiveRecord::Migration[7.0]
  def change

    change_table "jobs", force: :cascade do |t|
      t.belongs_to :client

    end

    change_table "clients", force: :cascade do |t|
      t.references :jobs
  
    end

  end
end
