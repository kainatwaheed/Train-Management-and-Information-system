class WelcomeController < ApplicationController
  before_action :authenticate_user!
  
   layout :choose_layout
 

  def index
  end

  def contact
    
  end

  private
  def choose_layout
      puts "#"*100, user_signed_in?, current_user.admin?
      if user_signed_in? and current_user.admin?
        "admin_layout"
      else
        "passenger_layout"
      end
    end
end
