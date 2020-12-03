class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_title




  


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end


  def blank_auction
    @auctions=Auction.all
    
    @auctions.each do |f|
      @last_bid=Bid.where(auction_id: f.id).last
      if f.end_date < DateTime.now.in_time_zone && f.active?

        if @last_bid.present?
          f.winner_id = @last_bid.user_id
          f.won
          f.save
          add_to_cart(f)
          winner_send(f)
          
          
        else
          f.abandon
          f.save
          
        end
      end
    end 
  end

  

  def winner_send(auction)          
      user= User.find(auction.winner_id)
      WinnerMailer.winner_send(user, auction.title).deliver_now
  end
    
  def set_title
    @page_title= 'SubastArt | Compra arte desde tu casa'
  end
  
  

  def current_order
    if current_user
      order = Order.where(user_id: current_user.id).where(status: "unpaid").last
        
        if order.nil?
          order = Order.create(user_id: current_user.id, status: "unpaid")
        end
      end
      return order
      
  end



  def add_to_cart(auction)
    current_order.add_item(auction, current_order.id)
    
  end

  
  
  


  
end
