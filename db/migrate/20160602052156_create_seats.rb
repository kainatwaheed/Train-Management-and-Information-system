class CreateSeats < ActiveRecord::Migration
  def change
    create_table :seats do |t|
      t.date :deptdate
      t.string :tname
      t.integer :seat1
      t.integer :seat2
      t.integer :seat3
      t.integer :trainroute_id

      t.timestamps null: false
    end
        add_index :seats, :trainroute_id

  end
end
