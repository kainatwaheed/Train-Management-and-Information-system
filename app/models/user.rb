class User < ActiveRecord::Base
  has_many :reservations
  has_many :trainroutes, through: :reservations
  validates :email, presence: true , uniqueness: true , format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
 cattr_accessor :current_user

 ROLES = %i[admin passenger]

 def roles=(roles)
   roles = [*roles].map { |r| r.to_sym }
   self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
 end

 def roles
   ROLES.reject do |r|
     ((roles_mask.to_i || 0) & 2**ROLES.index(r)).zero?
   end
 end

 def has_role?(role)
   roles.include?(role)
 end
end
