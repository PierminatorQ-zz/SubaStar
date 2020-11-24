class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end


  def blank_auction
    @auctions=Auction.all
    
    @auctions.each do |f|
      last_bid=Bid.where(auction_id: f.id).last
      if f.end_date < DateTime.now.in_time_zone && f.active?

        if last_bid.present?
          f.winner_id = last_bid.user_id
          f.won
          f.save
          #winner_send(f)
          
          
        else
          f.abandon
          f.save
          redirect_to root_path
        end
      end
    end


    def winner_send(auction)          
          userId= auction.winner_id
          user= User.find(userId)
          WinnerMailer.winner_send(user, auction.title).deliver_later
    end
  end

  

  
  


  
end
