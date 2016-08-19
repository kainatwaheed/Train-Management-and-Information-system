class AddTrainnameToTrainroute < ActiveRecord::Migration
  def change
    add_column :trainroutes, :trainname, :string
  end
end
