class CreateTimeslots < ActiveRecord::Migration[6.0]
  def change
    create_table :timeslots do |t|
      t.datetime :start_time
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
