class HomeController < ApplicationController
  def index
    
    if( params[:search] && !params[:search].empty? )
      @auctions = Auction.where("title LIKE ?", "%#{params[:search]}%").order(created_at: :desc)  
    else
      @auctions = Auction.only_active(@auction).order(created_at: :desc)
    end
  end


  
end
