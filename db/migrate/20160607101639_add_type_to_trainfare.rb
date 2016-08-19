class AddTypeToTrainfare < ActiveRecord::Migration
  def change
    add_column :trainfares, :traintype, :string
  end
end
