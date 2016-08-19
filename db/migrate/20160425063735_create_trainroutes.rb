class CreateTrainroutes < ActiveRecord::Migration
  def change
    create_table :trainroutes do |t|
      t.integer :train_id
      t.string :source
      t.string :destination
      t.date :deptdate
      t.date :arrivaldate
      t.time :deptime
      t.time :arrivaltime

      t.timestamps null: false
    end
    add_index :reservations, :train_id
    
  end
end
