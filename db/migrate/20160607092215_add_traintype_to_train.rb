class AddTraintypeToTrain < ActiveRecord::Migration
  def change
    add_column :trains, :traintype, :string
  end
end
