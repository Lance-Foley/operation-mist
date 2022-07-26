class CompanyVariables < ActiveRecord::Migration[7.0]
  def change
    add_column :variances, :hour_rate, :decimal
    rename_column :variances, :variance, :hour_variance
  end
end
