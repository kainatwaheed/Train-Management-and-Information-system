class Trainroute < ActiveRecord::Base
	belongs_to :train
	has_many :reservations ,dependent: :destroy
	has_many :users, through: :reservations

	validates_presence_of :deptdate,:arrivaldate ,:deptime, :train_id, :arrivaltime
	


end
