class Train < ActiveRecord::Base
	has_many :trainroutes, dependent: :destroy
	has_many :trainfares , dependent: :destroy
	# has_many :trainclasses, dependent: :destroy

	
validates_presence_of :name,:traintype
	
end
