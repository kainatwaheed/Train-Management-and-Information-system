class Reservation < ActiveRecord::Base
belongs_to :trainroute
belongs_to :user
validates_numericality_of :seats, only_integer: true, greater_than: 0 


	after_save :decrement_totalseat

def decrement_totalseat
		c= self.trainroute
		c.update(totalseat: c.totalseat-1)
		
	end

end
