class Station < ActiveRecord::Base

	belongs_to :trainroute


validates_length_of :name, maximum: 20
validates_presence_of :name
end
