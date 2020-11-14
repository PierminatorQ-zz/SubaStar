module HomeHelper
  def bid auction
    @bid =Bid.where(auction_id: auction.id).last
    
  end

  def last_bid auction
    @last_bid =Bid.where(auction_id: auction.id).last
    @last_bid.amount
  end

  def last_bid_name auction
    
    @last_bid =Bid.where(auction_id: auction.id).last
    @last_bid.user.name
  end

end
