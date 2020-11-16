class HomeController < ApplicationController
  before_action :blank_auction
  def index
    
    if( params[:search] && !params[:search].empty? )
      @auctions = Auction.where("title LIKE ?", "%#{params[:search]}%").only_active(@auction).order(created_at: :desc)  
    else
      @auctions = Auction.only_active(@auction).order(created_at: :desc)
    end
  end


  
end
