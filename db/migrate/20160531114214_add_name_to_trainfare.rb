class AddNameToTrainfare < ActiveRecord::Migration
  def change
    add_column :trainfares, :name, :string
  end
end
