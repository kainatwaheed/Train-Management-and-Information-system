class AddDistanceAndTotalseaToTrainroute < ActiveRecord::Migration
  def change
    add_column :trainroutes, :distance, :integer
    add_column :trainroutes, :totalseat, :integer
  end
end
