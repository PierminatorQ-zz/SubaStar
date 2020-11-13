class DashboardController < ApplicationController
  before_action :authenticate_user!
  layout "dashboard"

  def index
    @auctions= Auction.all
    @products=Product.all
    @users=User.all
    
  end
end
