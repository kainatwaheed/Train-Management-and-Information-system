class CreateTrainfares < ActiveRecord::Migration
  def change
    create_table :trainfares do |t|
      t.integer :train_id
      t.string :source
      t.string :destination
      t.integer :fare1
      t.integer :fare2
      t.integer :fare3

      t.timestamps null: false
    end
    add_index :trainfares, :train_id
    
  end
end
