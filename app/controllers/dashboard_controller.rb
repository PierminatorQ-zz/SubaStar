class DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :user_admin!, except: [:perfil]
 

  def index
    
    
    @users=User.all
    @auctions_by_user = Auction.all
                        .group(:status).count
    
    @money_average =Auction.where(winner_id:current_user.id)
                    .group(:initial_price)
                    .count
  end

  def user_admin!
    redirect_to root_path unless current_user.admin? 
  end

  def perfil
    @user = current_user
    @auctions = Auction.where(winner_id:@user.id)
  end

  def productos
    @products=Product.all
  end

  def auctions
    @auctions= Auction.all
  end
  


  

end
