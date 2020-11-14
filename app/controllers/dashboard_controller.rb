class DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :user_admin!
  layout "dashboard"

  def index
    @auctions= Auction.all
    @products=Product.all
    @users=User.all
    
  end

  def user_admin!
    redirect_to root_path unless current_user.admin? 
  end
  

end
