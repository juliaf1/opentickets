class RenameCityOnUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :city, :address
  end
end
