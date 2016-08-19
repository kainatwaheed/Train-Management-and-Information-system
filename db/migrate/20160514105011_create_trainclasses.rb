class CreateTrainclasses < ActiveRecord::Migration
  def change
    create_table :trainclasses do |t|
      t.string :name
      t.integer :train_id
      t.integer :totalseats
      t.integer :fare

      t.timestamps null: false
    end
  end
end
