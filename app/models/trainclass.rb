class Trainclass < ActiveRecord::Base
	belongs_to :train
	has_many :reservations, dependent: :destroy
	has_many :trainroutes, through: :reservations

	validates_inclusion_of :name, in: %w( Business Sleeper Economy)
	validates_numericality_of :fare, only_integer: true, greater_than: 0 
	validates_numericality_of :totalseats, only_integer: true, greater_than: 0
	validates_presence_of :name, :train_id, :totalseats, :fare
end
