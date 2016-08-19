class CreateTrains < ActiveRecord::Migration
  def change
    create_table :trains do |t|
      t.string :name
      t.integer :noofseats
      t.integer :noofclasses

      t.timestamps null: false
    end
  end
end
