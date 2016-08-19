class AddColumnAvailableToTrainroutes < ActiveRecord::Migration
  def change
	add_column :trainroutes, :available ,:boolean , :default => true
  end
end
