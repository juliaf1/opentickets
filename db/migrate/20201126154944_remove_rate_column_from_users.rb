class RemoveRateColumnFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :hourly_rate
  end
end
