class AddNameToTrainroute < ActiveRecord::Migration
  def change
    add_column :trainroutes, :name, :string
  end
end
