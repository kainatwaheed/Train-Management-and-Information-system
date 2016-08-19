class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :user_id
      t.integer :trainroute_id
      t.integer :seats

      t.timestamps null: false
    end
    add_index :reservations, :user_id
    add_index :reservations, :trainroute_id
    
  end
end
